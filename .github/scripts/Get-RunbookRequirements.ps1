<#
.SYNOPSIS
    Updates runbook requirements (PowerShell modules and permissions) in an existing markdown page.

.DESCRIPTION
    Scans all .ps1 files in a checked-out realmjoin/realmjoin-runbooks repository and extracts
    module requirements from the PowerShell '#requires -Modules' directive.

    If a module appears with different versions across runbooks, the highest version is selected.

    Additionally, the script collects required permissions from all '*.permissions.json' files
    located next to runbooks (same folder) and aggregates them uniquely.

    For Microsoft Graph API permissions, if a '<X>.Read.All' permission and the corresponding
    '<X>.ReadWrite.All' permission are both present, only the 'ReadWrite' permission is kept.

    The script then locates the sections '## PowerShell Modules' and '## Permissions' in a
    target markdown file and updates only:
    - the module table inside '## PowerShell Modules' (and the info hint below it)
    - the bullet lists under '### Entra ID Roles' and '### Graph API Permissions'
    The position of these sections and headings is determined by the presence of specific marker strings (info hints) to allow flexibility in the target markdown file structure. See parameters $startStringMarkerPowerShellModules and $startStringMarkerPermissions.

    The script fails if required sections/headers are missing.

.PARAMETER RunbooksRepoPath
    Path to the checked-out realmjoin/realmjoin-runbooks repository.

.PARAMETER TargetMarkdownFilePath
    Path to the markdown file containing the sections to update.

.PARAMETER startStringMarkerPowerShellModules
    A unique string that marks the start of the "## PowerShell Modules" section. Default is an info hint that is expected to be present in the target markdown.

.PARAMETER startStringMarkerPermissions
    A unique string that marks the start of the "## Permissions" section. Default is an info hint that is expected to be present in the target markdown.

.NOTES
    Intended to be run in CI. Output is written as UTF-8 without BOM.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]$RunbooksRepoPath,

    [Parameter(Mandatory = $true)]
    [string]$TargetMarkdownFilePath,

    [string]$startStringMarkerPowerShellModules = '{% hint style="info" %} The PowerShell Modules section is automatically updated based on the <a href="https://github.com/realmjoin/realmjoin-runbooks">public repository</a>. {% endhint %}',
    [string]$startStringMarkerPermissions = '{% hint style="info" %} The Permissions section is automatically updated based on the <a href="https://github.com/realmjoin/realmjoin-runbooks">public repository</a>. {% endhint %}'
)

############################################################
#region Functions
#
############################################################

    #region Helper Functions
    ##############################

    function Add-OrUpdateModuleRequirement {
        <#
        .SYNOPSIS
            Adds or updates a module requirement entry.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [hashtable]$ModuleMap,

            [Parameter(Mandatory = $true)]
            [string]$ModuleName,

            [Parameter(Mandatory = $false)]
            [string]$VersionText
        )

        $key = $ModuleName.Trim()
        if ([string]::IsNullOrWhiteSpace($key)) {
            return
        }

        $incomingText = if ([string]::IsNullOrWhiteSpace($VersionText)) { $null } else { $VersionText.Trim() }

        $incomingParsed = $null
        if (-not [string]::IsNullOrWhiteSpace($incomingText)) {
            $parsed = $null
            if ([version]::TryParse($incomingText.Trim(), [ref]$parsed)) {
                $incomingParsed = $parsed
            }
        }

        if (-not $ModuleMap.ContainsKey($key)) {
            $ModuleMap[$key] = [PSCustomObject]@{
                ModuleName    = $key
                VersionText   = $incomingText
                ParsedVersion = $incomingParsed
            }
            return
        }

        $current = $ModuleMap[$key]
        if ($null -eq $current.ParsedVersion -and $null -ne $incomingParsed) {
            $current.VersionText = $incomingText
            $current.ParsedVersion = $incomingParsed
            return
        }

        if ($null -ne $current.ParsedVersion -and $null -ne $incomingParsed) {
            if ($incomingParsed -gt $current.ParsedVersion) {
                $current.VersionText = $incomingText
                $current.ParsedVersion = $incomingParsed
            }
            return
        }

        if ([string]::IsNullOrWhiteSpace($current.VersionText) -and -not [string]::IsNullOrWhiteSpace($incomingText)) {
            $current.VersionText = $incomingText
            $current.ParsedVersion = $incomingParsed
        }
    }

    function Get-RequiredModulesFromScript {
        <#
        .SYNOPSIS
            Extracts required modules from a PowerShell script using AST parsing.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$ScriptPath
        )

        $tokens = $null
        $errors = $null

        $ast = [System.Management.Automation.Language.Parser]::ParseFile(
            $ScriptPath,
            [ref]$tokens,
            [ref]$errors
        )

        if ($null -eq $ast -or $null -eq $ast.ScriptRequirements) {
            return @()
        }

        if ($null -eq $ast.ScriptRequirements.RequiredModules) {
            return @()
        }

        return @($ast.ScriptRequirements.RequiredModules)
    }

    function Find-MarkdownSectionRange {
        <#
        .SYNOPSIS
            Finds the start/end line indexes of a markdown H2 section (## ...).
        #>
        param (
            [Parameter(Mandatory = $true)]
            [AllowEmptyString()]
            [string[]]$Lines,

            [Parameter(Mandatory = $true)]
            [string]$SectionHeader
        )

        $sectionStart = -1
        for ($i = 0; $i -lt $Lines.Length; $i++) {
            if ($Lines[$i].Trim() -eq $SectionHeader) {
                $sectionStart = $i
                break
            }
        }
        if ($sectionStart -lt 0) {
            throw "Required section not found in target markdown: '$SectionHeader'"
        }

        $sectionEnd = $Lines.Length
        for ($i = $sectionStart + 1; $i -lt $Lines.Length; $i++) {
            if ($Lines[$i] -match '^##\s+') {
                $sectionEnd = $i
                break
            }
        }

        return [PSCustomObject]@{
            StartIndex = $sectionStart
            EndIndex   = $sectionEnd
        }
    }

    function Replace-BulletListAfterHeading {
        <#
        .SYNOPSIS
            Replaces the first bullet list ("* ") after a markdown heading within a section.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [AllowEmptyString()]
            [string[]]$Lines,

            [Parameter(Mandatory = $true)]
            [int]$SectionStart,

            [Parameter(Mandatory = $true)]
            [int]$SectionEnd,

            [Parameter(Mandatory = $true)]
            [string]$Heading,

            [Parameter(Mandatory = $true)]
            [string[]]$NewBulletLines
        )

        $headingIndex = -1
        for ($i = $SectionStart; $i -lt $SectionEnd; $i++) {
            if ($Lines[$i].Trim() -eq $Heading) {
                $headingIndex = $i
                break
            }
        }
        if ($headingIndex -lt 0) {
            throw "Required heading not found in the permissions section: '$Heading'"
        }

        $listStart = -1
        for ($i = $headingIndex + 1; $i -lt $SectionEnd; $i++) {
            $trimmed = $Lines[$i].Trim()
            if ($trimmed -match '^#{1,6}\s+') {
                break
            }
            if ($trimmed.StartsWith('* ')) {
                $listStart = $i
                break
            }
        }
        if ($listStart -lt 0) {
            throw "Bullet list not found after heading: '$Heading'"
        }

        $listEnd = $listStart
        for ($i = $listStart + 1; $i -lt $SectionEnd; $i++) {
            if ($Lines[$i].Trim().StartsWith('* ')) {
                $listEnd = $i
                continue
            }
            break
        }

        $updated = New-Object System.Collections.Generic.List[string]
        for ($i = 0; $i -lt $Lines.Length; $i++) {
            if ($i -eq $listStart) {
                foreach ($line in $NewBulletLines) {
                    $updated.Add([string]$line)
                }
                $i = $listEnd
                continue
            }
            $updated.Add([string]$Lines[$i])
        }

        return $updated.ToArray()
    }

    function Get-PermissionRequirementsFromJsonFile {
        <#
        .SYNOPSIS
            Parses a '*.permissions.json' file and returns roles and app role assignments.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$Path
        )

        $raw = Get-Content -Raw -Path $Path -Encoding UTF8
        $obj = $raw | ConvertFrom-Json -ErrorAction Stop

        $roles = @()
        if ($null -ne $obj.Roles) {
            $roles = @($obj.Roles)
        }

        $permissions = @()
        if ($null -ne $obj.Permissions) {
            $permissions = @($obj.Permissions)
        }

        return [PSCustomObject]@{
            Roles       = $roles
            Permissions = $permissions
        }
    }

    #endregion Helper Functions

#endregion Functions

############################################################
#region Main Logic
#
############################################################

try {
    $resolvedRepoPath = (Resolve-Path -Path $RunbooksRepoPath -ErrorAction Stop).Path
    $resolvedTargetMarkdownFilePath = [System.IO.Path]::GetFullPath($TargetMarkdownFilePath)

    if (-not (Test-Path -Path $resolvedTargetMarkdownFilePath)) {
        throw "Target markdown file not found: $resolvedTargetMarkdownFilePath"
    }

    #region Collect Requirements
    ##############################

    $runbookFiles = Get-ChildItem -Path $resolvedRepoPath -Recurse -File -Filter "*.ps1" -ErrorAction Stop |
        Where-Object { $_.FullName -notmatch "[\\/]\\.git[\\/]" }

    $moduleMap = @{}
    foreach ($file in $runbookFiles) {
        $requiredModules = Get-RequiredModulesFromScript -ScriptPath $file.FullName
        foreach ($moduleSpec in $requiredModules) {
            $moduleName = $moduleSpec.Name
            $versionText = $null

            if ($null -ne $moduleSpec.RequiredVersion) {
                $versionText = $moduleSpec.RequiredVersion.ToString()
            } elseif ($null -ne $moduleSpec.Version) {
                $versionText = $moduleSpec.Version.ToString()
            }

            Add-OrUpdateModuleRequirement -ModuleMap $moduleMap -ModuleName $moduleName -VersionText $versionText
        }
    }

    $permissionFiles = Get-ChildItem -Path $resolvedRepoPath -Recurse -File -Include "*.permissions.json", "*.permission.json" -ErrorAction Stop |
        Where-Object { $_.FullName -notmatch "[\\/]\\.git[\\/]" }

    $roleSet = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::OrdinalIgnoreCase)
    $graphPermissionSet = New-Object System.Collections.Generic.HashSet[string]

    $graphAppId = '00000003-0000-0000-c000-000000000000'

    foreach ($file in $permissionFiles) {
        $req = Get-PermissionRequirementsFromJsonFile -Path $file.FullName

        foreach ($role in @($req.Roles)) {
            if (-not [string]::IsNullOrWhiteSpace($role)) {
                [void]$roleSet.Add($role.Trim())
            }
        }

        foreach ($permObj in @($req.Permissions)) {
            if ($null -eq $permObj) {
                continue
            }

            $permName = $null
            if ($null -ne $permObj.Name) {
                $permName = [string]$permObj.Name
            }
            $permId = $null
            if ($null -ne $permObj.Id) {
                $permId = [string]$permObj.Id
            }

            $isGraph = $false
            if (-not [string]::IsNullOrWhiteSpace($permId) -and $permId -eq $graphAppId) {
                $isGraph = $true
            }
            if (-not $isGraph -and -not [string]::IsNullOrWhiteSpace($permName)) {
                if ($permName -in @('Microsoft Graph', 'MS Graph')) {
                    $isGraph = $true
                }
            }

            if (-not $isGraph) {
                continue
            }

            foreach ($appRole in @($permObj.AppRoleAssignments)) {
                if (-not [string]::IsNullOrWhiteSpace($appRole)) {
                    [void]$graphPermissionSet.Add($appRole.Trim())
                }
            }
        }
    }

    $toRemove = New-Object System.Collections.Generic.List[string]
    foreach ($p in $graphPermissionSet) {
        $m = [regex]::Match($p, '^(?<prefix>.+)\.Read\.All$')
        if (-not $m.Success) {
            continue
        }
        $prefix = $m.Groups['prefix'].Value
        $candidate = "$prefix.ReadWrite.All"
        if ($graphPermissionSet.Contains($candidate)) {
            $toRemove.Add($p)
        }
    }
    foreach ($p in $toRemove) {
        [void]$graphPermissionSet.Remove($p)
    }

    $sortedModules = $moduleMap.Values | Sort-Object ModuleName
    $sortedRoles = $roleSet | Sort-Object { $_.ToLowerInvariant() }
    $sortedGraphPermissions = $graphPermissionSet | Sort-Object

    #endregion Collect Requirements

    #region Build Output Blocks
    ##############################

    $newModulesTableLines = New-Object System.Collections.Generic.List[string]
    $newModulesTableLines.Add('| Module | Minimum version in runbooks |')
    $newModulesTableLines.Add('|---|---|')
    foreach ($entry in $sortedModules) {
        $versionCell = if ([string]::IsNullOrWhiteSpace($entry.VersionText)) { 'Not specified' } else { $entry.VersionText }
        $moduleCell = '`' + $entry.ModuleName + '`'
        $newModulesTableLines.Add("| $moduleCell | $versionCell |")
    }

    $newRolesBulletLines = New-Object System.Collections.Generic.List[string]
    $textInfo = [System.Globalization.CultureInfo]::InvariantCulture.TextInfo
    foreach ($role in $sortedRoles) {
        $displayRole = $textInfo.ToTitleCase($role.ToLowerInvariant())
        $newRolesBulletLines.Add("* $displayRole")
    }

    $newGraphPermBulletLines = New-Object System.Collections.Generic.List[string]
    foreach ($perm in $sortedGraphPermissions) {
        $newGraphPermBulletLines.Add('* `' + $perm + '`')
    }

    #endregion Build Output Blocks

    #region Update Markdown
    ##############################

    $raw = Get-Content -Path $resolvedTargetMarkdownFilePath -Raw -Encoding UTF8
    $lines = @($raw -split "\r?\n")

    Write-Verbose "Markdown lines type: $($lines.GetType().FullName); Count: $($lines.Count)"

    # Update "## PowerShell Modules" table - starting marker is in the parameter $startStringMarkerPowerShellModules to allow flexibility in the target markdown file (in case the hint text changes etc.)
    $modulesSection = Find-MarkdownSectionRange -Lines $lines -SectionHeader $startStringMarkerPowerShellModules
    $modulesSectionStart = $modulesSection.StartIndex
    $modulesSectionEnd = $modulesSection.EndIndex

    $tableHeaderIndex = -1
    for ($i = $modulesSectionStart + 1; $i -lt $modulesSectionEnd; $i++) {
        if ($lines[$i].Trim() -eq '| Module | Minimum version in runbooks |') {
            $tableHeaderIndex = $i
            break
        }
    }
    if ($tableHeaderIndex -lt 0) {
        throw "Modules table header not found in the '## PowerShell Modules' section."
    }

    $tableEnd = $tableHeaderIndex
    for ($i = $tableHeaderIndex + 1; $i -lt $modulesSectionEnd; $i++) {
        if ($lines[$i].Trim().StartsWith('|')) {
            $tableEnd = $i
            continue
        }
        break
    }
    if ($tableEnd -le $tableHeaderIndex) {
        throw "Modules table appears to be empty or malformed in the '## PowerShell Modules' section."
    }

    $before = @()
    if ($tableHeaderIndex -gt 0) {
        $before = $lines[0..($tableHeaderIndex - 1)]
    }

    $after = @()
    if (($tableEnd + 1) -lt $lines.Length) {
        $after = $lines[($tableEnd + 1)..($lines.Length - 1)]
    }

    $updated = New-Object System.Collections.Generic.List[string]
    foreach ($line in $before) {
        $updated.Add([string]$line)
    }
    foreach ($line in $newModulesTableLines) {
        $updated.Add([string]$line)
    }
    foreach ($line in $after) {
        $updated.Add([string]$line)
    }

    $lines = $updated.ToArray()

    # Update "## Permissions" lists - starting marker is in the parameter $startStringMarkerPermissions to allow flexibility in the target markdown file (in case the hint text changes etc.)
    $permissionsSection = Find-MarkdownSectionRange -Lines $lines -SectionHeader $startStringMarkerPermissions
    $permStart = $permissionsSection.StartIndex
    $permEnd = $permissionsSection.EndIndex

    $lines = Replace-BulletListAfterHeading -Lines $lines -SectionStart $permStart -SectionEnd $permEnd -Heading '### Entra ID Roles' -NewBulletLines @($newRolesBulletLines)
    $lines = Replace-BulletListAfterHeading -Lines $lines -SectionStart $permStart -SectionEnd $permEnd -Heading '### Graph API Permissions' -NewBulletLines @($newGraphPermBulletLines)

    $newRaw = ($lines -join "`n")
    if (-not $newRaw.EndsWith("`n")) {
        $newRaw += "`n"
    }

    [System.IO.File]::WriteAllText(
        $resolvedTargetMarkdownFilePath,
        $newRaw,
        [System.Text.UTF8Encoding]::new($false)
    )

    #endregion Update Markdown

    Write-Host "✅ Runbook requirements updated: $resolvedTargetMarkdownFilePath"
    Write-Host "   Modules found: $($sortedModules.Count)"
    Write-Host "   Entra ID roles found: $($sortedRoles.Count)"
    Write-Host "   Graph API permissions found: $($sortedGraphPermissions.Count)"
} catch {
    Write-Error "Failed to update runbook requirements. $($_.Exception.Message)"
    if (-not [string]::IsNullOrWhiteSpace($_.ScriptStackTrace)) {
        Write-Error $_.ScriptStackTrace
    }
    exit 1
}

#endregion Main Logic
