<#
.SYNOPSIS
    Generates the runbook overview page from the realmjoin-runbooks repository.

.DESCRIPTION
    This script reads the pre-generated runbook list
    (docs/lists/custom/RealmJoinRunbook-RunbookList-noToc.md) from a local
    checkout of the realmjoin/realmjoin-runbooks repository.

    The content is validated and adapted for GitBook (frontmatter added,
    heading capitalized) before being written to the output file.

    The script exits with a non-zero exit code if the source file is missing
    or fails validation, so a calling workflow can detect the failure and
    trigger notifications. In that case the output file is left untouched.

.PARAMETER RunbooksRepoPath
    Path to a local checkout of the realmjoin/realmjoin-runbooks repository.

.PARAMETER OutputFilePath
    Path of the markdown file to write (e.g. ./docs/automation/runbooks/runbook-references/overview.md).

.EXAMPLE
    ./Get-RunbookOverview.ps1 -RunbooksRepoPath ./runbooks-repo -OutputFilePath ./docs/automation/runbooks/runbook-references/overview.md
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]$RunbooksRepoPath,

    [Parameter(Mandatory = $true)]
    [string]$OutputFilePath
)

############################################################
#region Variables
#
############################################################

# Relative path of the source file inside the runbooks repository
$sourceRelativePath = "docs/lists/custom/RealmJoinRunbook-RunbookList-noToc.md"

# GitBook frontmatter prepended to the generated page (title is set here instead of an H1 in the content to avoid a duplicated page title)
$frontmatter = "---`ntitle: Runbook Overview`nlayout:`n  width: wide`n---`n"

#endregion Variables

############################################################
#region Functions
#
############################################################

    #region Helper Functions
    ##############################

    function Get-SourceContent {
        <#
        .SYNOPSIS
            Retrieves the raw source markdown content.

        .DESCRIPTION
            Reads the source file from the local runbooks repository checkout.
            Throws if the file does not exist.

        .OUTPUTS
            String. The raw markdown content of the source file.
        #>
        param ()

        $localSourcePath = Join-Path -Path $RunbooksRepoPath -ChildPath $sourceRelativePath

        if (-not (Test-Path -Path $localSourcePath -PathType Leaf)) {
            throw "Source file not found in runbooks checkout: $localSourcePath"
        }

        Write-Host "📄 Using source file from local checkout: $localSourcePath"
        return Get-Content -Path $localSourcePath -Raw -Encoding UTF8
    }

    function Test-SourceContent {
        <#
        .SYNOPSIS
            Validates the retrieved source content.

        .DESCRIPTION
            Ensures the content looks like the expected runbook overview list
            (heading present, contains markdown table rows) to avoid
            publishing empty or unrelated content.

        .PARAMETER Content
            The raw markdown content to validate.

        .OUTPUTS
            Boolean. True if the content passes validation.
        #>
        param (
            [Parameter(Mandatory = $false)]
            [string]$Content
        )

        if ([string]::IsNullOrWhiteSpace($Content)) {
            Write-Error "Source content is empty."
            return $false
        }

        if ($Content -notmatch '(?im)^#\s+Runbook overview\s*$') {
            Write-Error "Source content does not contain the expected '# Runbook overview' heading."
            return $false
        }

        $tableRowCount = ([regex]::Matches($Content, '(?m)^\|')).Count
        if ($tableRowCount -lt 20) {
            Write-Error "Source content contains only $tableRowCount table rows, expected at least 20. Content looks incomplete."
            return $false
        }

        return $true
    }

    #endregion Helper Functions

#endregion Functions

############################################################
#region Main Logic
#
############################################################

    #region Retrieve and Validate
    ##############################

    try {
        $sourceContent = Get-SourceContent
    } catch {
        Write-Error "Failed to retrieve runbook overview source. $($_.Exception.Message)"
        exit 1
    }

    if (-not (Test-SourceContent -Content $sourceContent)) {
        exit 1
    }

    Write-Host "✅ Source content retrieved and validated"

    #endregion Retrieve and Validate

    #region Transform and Write
    ##############################

    # Normalize line endings to LF
    $content = $sourceContent -replace "`r`n", "`n"

    # Remove the leading anchor and main heading; the page title is provided via frontmatter,
    # otherwise GitBook would render both the page title and the H1 (duplicated title)
    $content = $content -replace "(?m)^<a name='runbook-overview'></a>\s*\n#\s+Runbook overview\s*\n?", ''

    # Trim trailing whitespace and ensure a single trailing newline
    $content = $content.TrimEnd() + "`n"

    # Prepend GitBook frontmatter
    $content = $frontmatter + $content

    # Write output as UTF-8 without BOM
    $resolvedOutputPath = [System.IO.Path]::GetFullPath($OutputFilePath, (Get-Location).Path)
    [System.IO.File]::WriteAllText($resolvedOutputPath, $content)

    Write-Host "✅ Runbook overview written to: $OutputFilePath"

    #endregion Transform and Write

#endregion Main Logic
