<#
.SYNOPSIS
    Copies the Runbook Changelog markdown from the realmjoin-runbooks repository.

.DESCRIPTION
    Reads the CHANGELOG.md from a checked-out realmjoin/realmjoin-runbooks repository and
    writes it to an output path without modifying the content.

.PARAMETER RunbooksRepoPath
    Path to the checked-out realmjoin-runbooks repository.

.PARAMETER OutputFilePath
    Path to the output markdown file (e.g. docs/automation/runbooks/runbook-changelog.md).

.PARAMETER ChangelogFileName
    Name of the changelog file inside the runbooks repository. Defaults to CHANGELOG.md.

.NOTES
    The output is intended to be committed by CI.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]$RunbooksRepoPath,

    [Parameter(Mandatory = $true)]
    [string]$OutputFilePath,

    [Parameter(Mandatory = $false)]
    [string]$ChangelogFileName = "CHANGELOG.md"
)

############################################################
#region Functions
#
############################################################

    #region Helper Functions
    ##############################

    function Resolve-FullPath {
        <#
        .SYNOPSIS
            Resolves a path to an absolute filesystem path.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$Path
        )

        return (Resolve-Path -Path $Path -ErrorAction Stop).Path
    }

    #endregion Helper Functions

#endregion Functions

############################################################
#region Main Logic
#
############################################################

try {
    $resolvedRepoPath = Resolve-FullPath -Path $RunbooksRepoPath

    $resolvedOutputFilePath = [System.IO.Path]::GetFullPath($OutputFilePath)
    $outputDir = Split-Path -Path $resolvedOutputFilePath -Parent
    if (-not (Test-Path -Path $outputDir)) {
        New-Item -Path $outputDir -ItemType Directory -Force | Out-Null
    }

    $changelogPath = Join-Path -Path $resolvedRepoPath -ChildPath $ChangelogFileName
    if (-not (Test-Path -Path $changelogPath)) {
        throw "Changelog file not found: $changelogPath"
    }

    $rawChangelog = Get-Content -Path $changelogPath -Raw -Encoding UTF8
    [System.IO.File]::WriteAllText(
        $resolvedOutputFilePath,
        $rawChangelog,
        [System.Text.UTF8Encoding]::new($false)
    )

    Write-Host "✅ Runbook changelog copied to: $resolvedOutputFilePath"
} catch {
    Write-Error "Failed to generate runbook changelog. $($_.Exception.Message)"
    exit 1
}

#endregion Main Logic
