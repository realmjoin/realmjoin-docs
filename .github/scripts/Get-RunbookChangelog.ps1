<#
.SYNOPSIS
    Generates the RealmJoin Runbooks release notes page from GitHub Releases.

.DESCRIPTION
    Fetches all published releases of the realmjoin/realmjoin-runbooks repository via the
    GitHub REST API and renders them into a single markdown page. The release body text is
    taken verbatim from GitHub and is not modified; only a title/heading is added per release.

    The page ends with a reference link to the raw CHANGELOG.md in the runbooks repository.

    Three rendering styles are supported:
    - Details : each release in an expandable <details> block; the newest one is expanded.
    - Updates : a GitBook {% updates %} timeline with one {% update %} entry per release.
    - Hybrid  : the newest release rendered fully expanded, older releases in <details> blocks.

.PARAMETER OutputFilePath
    Path to the output markdown file (e.g. docs/automation/runbooks/release-notes.md).

.PARAMETER Repo
    The owner/name of the repository to read releases from. Defaults to realmjoin/realmjoin-runbooks.

.PARAMETER Style
    The rendering style for the page. One of: Details, Updates, Hybrid. Defaults to Details.

.PARAMETER Token
    Optional GitHub token used to authenticate API requests and avoid rate limiting.
    The repository is public, so a token is not strictly required.

.PARAMETER PageTitle
    The H1 title of the generated page. Defaults to "Runbook Release Notes".

.PARAMETER ChangelogRef
    The git ref (branch/tag) used when building the CHANGELOG.md reference link. Defaults to production.

.PARAMETER ChangelogFileName
    Name of the changelog file inside the runbooks repository. Defaults to CHANGELOG.md.

.NOTES
    Intended to be run in CI. Output is written as UTF-8 without BOM.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]$OutputFilePath,

    [Parameter(Mandatory = $false)]
    [string]$Repo = "realmjoin/realmjoin-runbooks",

    [Parameter(Mandatory = $false)]
    [ValidateSet("Details", "Updates", "Hybrid")]
    [string]$Style = "Details",

    [Parameter(Mandatory = $false)]
    [string]$Token,

    [Parameter(Mandatory = $false)]
    [string]$PageTitle = "Runbook Release Notes",

    [Parameter(Mandatory = $false)]
    [string]$ChangelogRef = "production",

    [Parameter(Mandatory = $false)]
    [string]$ChangelogFileName = "CHANGELOG.md"
)

############################################################
#region Functions
#
############################################################

    #region Helper Functions
    ##############################

    function Get-GitHubReleases {
        <#
        .SYNOPSIS
            Retrieves all published (non-draft) releases for a repository via the GitHub REST API.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$Repository,

            [Parameter(Mandatory = $false)]
            [string]$AccessToken
        )

        $headers = @{
            "Accept"               = "application/vnd.github+json"
            "X-GitHub-Api-Version" = "2022-11-28"
            "User-Agent"           = "realmjoin-docs-release-notes"
        }
        if (-not [string]::IsNullOrWhiteSpace($AccessToken)) {
            $headers["Authorization"] = "Bearer $AccessToken"
        }

        $releases = [System.Collections.Generic.List[object]]::new()
        $page = 1
        do {
            $uri = "https://api.github.com/repos/$Repository/releases?per_page=100&page=$page"
            $batch = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get -ErrorAction Stop

            if ($null -eq $batch -or $batch.Count -eq 0) {
                break
            }

            foreach ($release in $batch) {
                if ($release.draft) {
                    continue
                }
                $releases.Add($release)
            }

            $page++
        } while ($batch.Count -eq 100)

        return $releases
    }

    function Get-ReleaseTitle {
        <#
        .SYNOPSIS
            Determines the display title of a release, preferring the release name over the tag.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [object]$Release
        )

        if (-not [string]::IsNullOrWhiteSpace($Release.name)) {
            return $Release.name.Trim()
        }
        return $Release.tag_name.Trim()
    }

    function Get-ReleaseDate {
        <#
        .SYNOPSIS
            Returns the release date (yyyy-MM-dd) based on published_at, falling back to created_at.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [object]$Release
        )

        $rawDate = $Release.published_at
        if ($null -eq $rawDate -or ($rawDate -is [string] -and [string]::IsNullOrWhiteSpace($rawDate))) {
            $rawDate = $Release.created_at
        }

        # Invoke-RestMethod may already convert ISO 8601 timestamps to [datetime]; use them directly.
        if ($rawDate -is [datetime]) {
            return $rawDate.ToString("yyyy-MM-dd", [System.Globalization.CultureInfo]::InvariantCulture)
        }

        $parsed = [datetime]::MinValue
        if ([datetime]::TryParse(
                [string]$rawDate,
                [System.Globalization.CultureInfo]::InvariantCulture,
                [System.Globalization.DateTimeStyles]::RoundtripKind,
                [ref]$parsed)) {
            return $parsed.ToString("yyyy-MM-dd", [System.Globalization.CultureInfo]::InvariantCulture)
        }
        return ""
    }

    function Get-ReleaseBody {
        <#
        .SYNOPSIS
            Returns the release body verbatim, normalizing line endings to LF and trimming trailing whitespace.
            Pipe tables are converted to GitBook HTML tables with narrow fixed-width leading columns so the
            wide last column (e.g. "Details") stays readable. The wording of each cell is preserved.
        .PARAMETER Compact
            When set, the leading table columns use even narrower widths (used inside <details> boxes).
        #>
        param (
            [Parameter(Mandatory = $true)]
            [object]$Release,

            [Parameter(Mandatory = $false)]
            [switch]$Compact
        )

        $body = $Release.body
        if ($null -eq $body) {
            return ""
        }

        $body = $body -replace "`r`n", "`n" -replace "`r", "`n"
        $body = $body.Trim()
        $body = Convert-HeadingDepth -Body $body
        return Convert-ReleaseTable -Body $body -Compact:$Compact
    }

    function Convert-HeadingDepth {
        <#
        .SYNOPSIS
            Demotes every ATX heading in the release body by one level (e.g. "## Changes" -> "### Changes")
            so the release's inner sections appear nested under the release title in the table of contents.
            Headings inside fenced code blocks are left untouched.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$Body
        )

        $lines = $Body -split "`n"
        $inFence = $false

        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -match '^\s*```') {
                $inFence = -not $inFence
                continue
            }
            # Only demote real ATX headings (h1-h5) that are not inside a code fence.
            if (-not $inFence -and $lines[$i] -match '^#{1,5}\s+\S') {
                $lines[$i] = '#' + $lines[$i]
            }
        }

        return ($lines -join "`n")
    }

    function ConvertTo-HtmlInline {
        <#
        .SYNOPSIS
            Converts the inline markdown used inside table cells (links, code, bold) to equivalent HTML,
            so the content renders correctly inside a GitBook HTML table. Wording is not changed.
        #>
        param (
            [Parameter(Mandatory = $false)]
            [string]$Text
        )

        if ([string]::IsNullOrEmpty($Text)) {
            return ""
        }

        $result = $Text
        # Markdown links: [text](url) -> <a href="url">text</a>
        $result = [regex]::Replace($result, '\[([^\]]+)\]\(([^)]+)\)', '<a href="$2">$1</a>')
        # Inline code: `code` -> <code>code</code>
        $result = [regex]::Replace($result, '`([^`]+)`', '<code>$1</code>')
        # Bold: **text** -> <strong>text</strong>
        $result = [regex]::Replace($result, '\*\*([^*]+)\*\*', '<strong>$1</strong>')
        return $result
    }

    function Split-TableRow {
        <#
        .SYNOPSIS
            Splits a markdown table row into trimmed cell values, honoring escaped pipes (\|).
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$Row
        )

        $trimmed = $Row.Trim()
        $trimmed = $trimmed -replace '^\|', '' -replace '\|$', ''
        $cells = [regex]::Split($trimmed, '(?<!\\)\|')
        return $cells | ForEach-Object { ($_ -replace '\\\|', '|').Trim() }
    }

    function ConvertTo-HtmlTable {
        <#
        .SYNOPSIS
            Converts a collected markdown table (header, separator, rows) into a GitBook HTML table.
            The first (Type) and fourth (Runbook) columns use fixed widths; the remaining leading columns
            (e.g. Domain, Subcategory) are sized to the longest value actually present, so unused width
            goes to the last column. The last column fills the rest.
        .PARAMETER Compact
            When set, the fixed columns use narrower widths to leave more room for the last column.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [System.Collections.Generic.List[string]]$TableLines,

            [Parameter(Mandatory = $false)]
            [switch]$Compact
        )

        # Fixed widths (in px) for the Type (index 0) and Runbook (index 3) columns.
        $typeWidth = if ($Compact) { 48 } else { 64 }
        $runbookWidth = if ($Compact) { 140 } else { 176 }
        # Content-driven sizing for the remaining leading columns (rendered as plain text).
        $charWidth = 9
        $cellPadding = 28
        $minWidth = 50

        $header = @(Split-TableRow -Row $TableLines[0])
        $columnCount = $header.Count

        # Pre-parse the data rows once (reused for width calculation and rendering).
        $dataRows = [System.Collections.Generic.List[string[]]]::new()
        for ($r = 2; $r -lt $TableLines.Count; $r++) {
            $dataRows.Add(@(Split-TableRow -Row $TableLines[$r]))
        }

        # Determine the width of every leading column (all columns except the last).
        $leadingWidths = @()
        for ($c = 0; $c -lt ($columnCount - 1); $c++) {
            if ($c -eq 0) {
                $leadingWidths += $typeWidth
            } elseif ($c -eq 3) {
                $leadingWidths += $runbookWidth
            } else {
                $maxLen = 0
                foreach ($row in $dataRows) {
                    if ($c -lt $row.Count) {
                        # Strip inline code/bold markers so only the visible text length counts.
                        $visible = $row[$c] -replace '[`*]', ''
                        if ($visible.Length -gt $maxLen) { $maxLen = $visible.Length }
                    }
                }
                $computed = [int][math]::Ceiling(($maxLen * $charWidth) + $cellPadding)
                if ($computed -lt $minWidth) { $computed = $minWidth }
                $leadingWidths += $computed
            }
        }

        $sb = [System.Text.StringBuilder]::new()
        [void]$sb.Append('<table data-full-width="true"><thead><tr>')
        for ($c = 0; $c -lt $columnCount; $c++) {
            $headerText = $header[$c]
            # GitBook requires a header label for every column (empty headers render as a "Text"
            # placeholder), so give the leading action-symbol column a short header.
            if ([string]::IsNullOrWhiteSpace($headerText) -and $c -eq 0) {
                $headerText = "Type"
            }
            $cellHtml = ConvertTo-HtmlInline -Text $headerText
            if ($c -lt ($columnCount - 1)) {
                $width = $leadingWidths[$c]
                [void]$sb.Append("<th width=`"$width`">$cellHtml</th>")
            } else {
                [void]$sb.Append("<th>$cellHtml</th>")
            }
        }
        [void]$sb.Append('</tr></thead><tbody>')

        foreach ($cells in $dataRows) {
            [void]$sb.Append('<tr>')
            for ($c = 0; $c -lt $columnCount; $c++) {
                $value = if ($c -lt $cells.Count) { $cells[$c] } else { "" }
                # Remove inline code formatting from the leading columns (Domain, Subcategory, Runbook)
                # so they render as compact plain text; the last column (Details) keeps its formatting.
                if ($c -lt ($columnCount - 1)) {
                    $value = $value -replace '`', ''
                }
                [void]$sb.Append('<td>' + (ConvertTo-HtmlInline -Text $value) + '</td>')
            }
            [void]$sb.Append('</tr>')
        }

        [void]$sb.Append('</tbody></table>')
        return $sb.ToString()
    }

    function Convert-ReleaseTable {
        <#
        .SYNOPSIS
            Scans a release body for markdown pipe tables and replaces them with GitBook HTML tables.
            Non-table content is returned unchanged.
        .PARAMETER Compact
            When set, generated tables use narrower leading columns (passed through to ConvertTo-HtmlTable).
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$Body,

            [Parameter(Mandatory = $false)]
            [switch]$Compact
        )

        $lines = $Body -split "`n"
        $output = [System.Collections.Generic.List[string]]::new()
        $i = 0

        while ($i -lt $lines.Count) {
            $line = $lines[$i]
            $isRow = $line -match '^\s*\|.*\|\s*$'
            $hasSeparator = ($i + 1) -lt $lines.Count `
                -and $lines[$i + 1] -match '^\s*\|?[\s:\-\|]+\|?\s*$' `
                -and $lines[$i + 1] -match '-'

            if ($isRow -and $hasSeparator) {
                $tableLines = [System.Collections.Generic.List[string]]::new()
                $tableLines.Add($line)
                $tableLines.Add($lines[$i + 1])
                $j = $i + 2
                while ($j -lt $lines.Count -and $lines[$j] -match '^\s*\|.*\|\s*$') {
                    $tableLines.Add($lines[$j])
                    $j++
                }

                $output.Add("")
                $output.Add((ConvertTo-HtmlTable -TableLines $tableLines -Compact:$Compact))
                $output.Add("")
                $i = $j
            } else {
                $output.Add($line)
                $i++
            }
        }

        return ($output -join "`n")
    }

    #endregion Helper Functions

    #region Rendering Functions
    ##############################

    function Format-DetailsStyle {
        <#
        .SYNOPSIS
            Renders releases as expandable <details> blocks; the first (newest) release is expanded.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [System.Collections.Generic.List[object]]$Releases
        )

        $sb = [System.Text.StringBuilder]::new()
        $isFirst = $true

        foreach ($release in $Releases) {
            $title = Get-ReleaseTitle -Release $release
            $body = Get-ReleaseBody -Release $release -Compact

            $openAttr = if ($isFirst) { " open" } else { "" }

            [void]$sb.AppendLine("<details$openAttr>")
            [void]$sb.AppendLine("<summary><strong>$title</strong></summary>")
            [void]$sb.AppendLine("")
            [void]$sb.AppendLine($body)
            [void]$sb.AppendLine("")
            [void]$sb.AppendLine("</details>")
            [void]$sb.AppendLine("")

            $isFirst = $false
        }

        return $sb.ToString().TrimEnd()
    }

    function Format-UpdatesStyle {
        <#
        .SYNOPSIS
            Renders releases as a GitBook {% updates %} timeline with one {% update %} entry per release.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [System.Collections.Generic.List[object]]$Releases
        )

        $sb = [System.Text.StringBuilder]::new()
        [void]$sb.AppendLine('{% updates %}')

        foreach ($release in $Releases) {
            $title = Get-ReleaseTitle -Release $release
            $date = Get-ReleaseDate -Release $release
            $body = Get-ReleaseBody -Release $release

            $dateAttr = if ([string]::IsNullOrWhiteSpace($date)) { "" } else { " date=`"$date`"" }

            [void]$sb.AppendLine("{% update$dateAttr %}")
            [void]$sb.AppendLine("## $title")
            [void]$sb.AppendLine("")
            [void]$sb.AppendLine($body)
            [void]$sb.AppendLine("{% endupdate %}")
            [void]$sb.AppendLine("")
        }

        [void]$sb.AppendLine('{% endupdates %}')
        return $sb.ToString().TrimEnd()
    }

    function Format-HybridStyle {
        <#
        .SYNOPSIS
            Renders the newest release fully expanded and older releases as <details> blocks.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [System.Collections.Generic.List[object]]$Releases
        )

        $sb = [System.Text.StringBuilder]::new()

        if ($Releases.Count -gt 0) {
            $latest = $Releases[0]
            $title = Get-ReleaseTitle -Release $latest
            $body = Get-ReleaseBody -Release $latest

            [void]$sb.AppendLine("## $title")
            [void]$sb.AppendLine("")
            [void]$sb.AppendLine($body)
            [void]$sb.AppendLine("")
        }

        if ($Releases.Count -gt 1) {
            [void]$sb.AppendLine("## Previous releases")
            [void]$sb.AppendLine("")

            for ($i = 1; $i -lt $Releases.Count; $i++) {
                $release = $Releases[$i]
                $title = Get-ReleaseTitle -Release $release
                $body = Get-ReleaseBody -Release $release -Compact

                [void]$sb.AppendLine("<details>")
                [void]$sb.AppendLine("<summary><strong>$title</strong></summary>")
                [void]$sb.AppendLine("")
                [void]$sb.AppendLine($body)
                [void]$sb.AppendLine("")
                [void]$sb.AppendLine("</details>")
                [void]$sb.AppendLine("")
            }
        }

        return $sb.ToString().TrimEnd()
    }

    #endregion Rendering Functions

#endregion Functions

############################################################
#region Main Logic
#
############################################################

try {
    $resolvedOutputFilePath = [System.IO.Path]::GetFullPath($OutputFilePath)
    $outputDir = Split-Path -Path $resolvedOutputFilePath -Parent
    if (-not (Test-Path -Path $outputDir)) {
        New-Item -Path $outputDir -ItemType Directory -Force | Out-Null
    }

    Write-Host "🔍 Fetching releases for $Repo ..."
    $releases = Get-GitHubReleases -Repository $Repo -AccessToken $Token
    Write-Host "✅ Retrieved $($releases.Count) release(s)"

    if ($releases.Count -eq 0) {
        throw "No releases found for repository: $Repo"
    }

    switch ($Style) {
        "Updates" { $releasesMarkdown = Format-UpdatesStyle -Releases $releases }
        "Hybrid" { $releasesMarkdown = Format-HybridStyle -Releases $releases }
        default { $releasesMarkdown = Format-DetailsStyle -Releases $releases }
    }

    $repoUrl = "https://github.com/$Repo"
    $releasesUrl = "$repoUrl/releases"
    $changelogUrl = "$repoUrl/blob/$ChangelogRef/$ChangelogFileName"

    $page = [System.Text.StringBuilder]::new()
    [void]$page.AppendLine("---")
    [void]$page.AppendLine("layout:")
    [void]$page.AppendLine("  width: wide")
    [void]$page.AppendLine("---")
    [void]$page.AppendLine("")
    [void]$page.AppendLine("# $PageTitle")
    [void]$page.AppendLine("")
    [void]$page.AppendLine($releasesMarkdown)
    [void]$page.AppendLine("")
    [void]$page.AppendLine("***")
    [void]$page.AppendLine("")
    [void]$page.AppendLine("Prefer a different view? Browse these notes on the [GitHub Releases page]($releasesUrl) of the runbooks repository.")
    [void]$page.AppendLine("")
    [void]$page.AppendLine("Looking for a more detailed, dated log of every individual runbook change? See the full [changelog]($changelogUrl) in the runbooks repository.")

    $finalContent = $page.ToString().TrimEnd() + "`n"

    [System.IO.File]::WriteAllText(
        $resolvedOutputFilePath,
        $finalContent,
        [System.Text.UTF8Encoding]::new($false)
    )

    Write-Host "✅ Release notes ($Style) written to: $resolvedOutputFilePath"
} catch {
    Write-Error "Failed to generate runbook release notes. $($_.Exception.Message)"
    exit 1
}

#endregion Main Logic
