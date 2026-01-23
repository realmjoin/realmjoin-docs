<#
.SYNOPSIS
    Updates the SUMMARY.md file with runbook references.

.DESCRIPTION
    This script scans the runbook-references directory and updates only the
    runbook references section in SUMMARY.md while preserving all other content.

.PARAMETER RunbookReferencesPath
    Path to the runbook-references directory.

.PARAMETER SummaryPath
    Path to the SUMMARY.md file to update.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]$RunbookReferencesPath,

    [Parameter(Mandatory = $true)]
    [string]$SummaryPath
)

############################################################
#region Functions
#
############################################################

    #region Helper Functions
    ##############################

    function Get-FolderStructure {
        <#
        .SYNOPSIS
            Recursively scans a directory structure.

        .DESCRIPTION
            Creates a hierarchical representation of folders and files.

        .PARAMETER Path
            The directory path to scan.

        .PARAMETER RelativePath
            The relative path from the base runbook-references directory.

        .PARAMETER Depth
            Current depth level for indentation.

        .OUTPUTS
            PSCustomObject. Returns objects representing the folder structure.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$Path,

            [Parameter(Mandatory = $false)]
            [string]$RelativePath = "",

            [Parameter(Mandatory = $false)]
            [int]$Depth = 0
        )

        $items = Get-ChildItem -Path $Path | Sort-Object { $_.PSIsContainer }, Name

        foreach ($item in $items) {
            $itemRelativePath = if ($RelativePath) {
                Join-Path -Path $RelativePath -ChildPath $item.Name
            } else {
                $item.Name
            }

            if ($item.PSIsContainer) {
                # It's a folder
                [PSCustomObject]@{
                    Type = "Folder"
                    Name = $item.Name
                    Path = $itemRelativePath
                    Depth = $Depth
                    FullPath = $item.FullName
                }

                # Recursively get child items
                Get-FolderStructure -Path $item.FullName -RelativePath $itemRelativePath -Depth ($Depth + 1)
            } else {
                # It's a file (only include .md files, exclude README.md)
                if ($item.Extension -eq '.md' -and $item.Name -ne 'README.md') {
                    [PSCustomObject]@{
                        Type = "File"
                        Name = $item.BaseName
                        Path = $itemRelativePath
                        Depth = $Depth
                        FullPath = $item.FullName
                    }
                }
            }
        }
    }

    function Get-FriendlyName {
        <#
        .SYNOPSIS
            Converts a filename or folder name to a friendly display name.

        .DESCRIPTION
            Converts kebab-case or snake-case names to Title Case with spaces.

        .PARAMETER Name
            The name to convert.

        .OUTPUTS
            String. Returns the friendly display name.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$Name
        )

        # Replace hyphens and underscores with spaces
        $friendlyName = $Name -replace '[-_]', ' '

        # Convert to Title Case
        $textInfo = (Get-Culture).TextInfo
        $friendlyName = $textInfo.ToTitleCase($friendlyName.ToLower())

        # Special case: AVD should be all uppercase, Org should be Organization
        $friendlyName = $friendlyName -replace '\bAvd\b', 'AVD'
        $friendlyName = $friendlyName -replace '\bOrg\b', 'Organization'

        return $friendlyName
    }

    function New-SummaryEntry {
        <#
        .SYNOPSIS
            Creates a SUMMARY.md entry for a file or folder.

        .DESCRIPTION
            Generates the markdown list item with proper indentation.

        .PARAMETER Item
            The item object (file or folder) to create an entry for.

        .PARAMETER BasePath
            The base path for relative links.

        .OUTPUTS
            String. Returns the formatted SUMMARY.md entry.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [PSCustomObject]$Item,

            [Parameter(Mandatory = $true)]
            [string]$BasePath
        )

        $indent = "  " * ($Item.Depth + 2)  # +2 because runbook-references is at level 2 (4 spaces)
        $friendlyName = Get-FriendlyName -Name $Item.Name
        $relativePath = "$BasePath/$($Item.Path -replace '\\', '/')"

        if ($Item.Type -eq "Folder") {
            return "$indent* [$friendlyName]($relativePath/README.md)"
        } else {
            return "$indent* [$friendlyName]($relativePath)"
        }
    }

    function Get-RunbookInfo {
        <#
        .SYNOPSIS
            Extracts runbook information from a markdown file.

        .DESCRIPTION
            Reads the markdown and extracts title and description.

        .PARAMETER FilePath
            Path to the runbook markdown file.

        .OUTPUTS
            PSCustomObject with Name, Title, and Description.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$FilePath
        )

        $content = Get-Content -Path $FilePath -Raw -Encoding UTF8
        $title = ""
        $description = ""

        # Extract title from frontmatter first
        if ($content -match '(?ms)^---\s*\ntitle:\s*(.+?)\n') {
            $title = $matches[1].Trim()
        }
        # If not found in frontmatter, try H1 heading
        elseif ($content -match '(?m)^#\s+(.+?)$') {
            $title = $matches[1].Trim()
        }

        # Extract description from frontmatter first
        if ($content -match '(?ms)^---\s*\n.*?description:\s*(.+?)\n') {
            $description = $matches[1].Trim()
        }
        # If not found in frontmatter, try first paragraph after H1
        elseif ($content -match '(?ms)^#\s+.+?\n\n(.+?)(?:\n\n|$)') {
            $description = $matches[1].Trim()
            # Remove any markdown formatting
            $description = $description -replace '\*\*', ''
            $description = $description -replace '\*', ''
            $description = $description -replace '^\s*-\s*', ''
        }

        return [PSCustomObject]@{
            Name = (Get-Item $FilePath).BaseName
            Title = $title
            Description = $description
            FileName = (Get-Item $FilePath).Name
        }
    }

    function New-SubfolderReadme {
        <#
        .SYNOPSIS
            Creates a README.md file for a subfolder with runbook listings.

        .DESCRIPTION
            Generates README.md with links to all runbooks in subcategories.

        .PARAMETER FolderPath
            The full path to the folder.

        .PARAMETER FolderName
            The name of the folder.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$FolderPath,

            [Parameter(Mandatory = $true)]
            [string]$FolderName
        )

        $friendlyName = Get-FriendlyName -Name $FolderName
        $readmePath = Join-Path -Path $FolderPath -ChildPath "README.md"

        # Get all subfolders
        $subfolders = Get-ChildItem -Path $FolderPath -Directory | Sort-Object Name

        # Start building content
        $content = @"
---
title: $friendlyName
---

# $friendlyName Runbooks

This folder contains runbooks for $($friendlyName.ToLower()) management and operations.

## Runbooks by Category

"@

        $totalRunbooks = 0
        $categoryBreakdown = @()

        foreach ($subfolder in $subfolders) {
            $subfolderFriendlyName = Get-FriendlyName -Name $subfolder.Name
            $content += "`n### $subfolderFriendlyName`n`n"

            # Get all markdown files in this subfolder (excluding README.md)
            $runbooks = Get-ChildItem -Path $subfolder.FullName -Filter "*.md" |
                        Where-Object { $_.Name -ne "README.md" } |
                        Sort-Object Name

            $runbookCount = $runbooks.Count
            $totalRunbooks += $runbookCount

            foreach ($runbook in $runbooks) {
                $runbookInfo = Get-RunbookInfo -FilePath $runbook.FullName
                $relativePath = "$($subfolder.Name)/$($runbook.Name)"
                $content += "- [$($runbookInfo.Title)]($relativePath)"

                if ($runbookInfo.Description) {
                    $content += " - $($runbookInfo.Description)"
                }

                $content += "`n"
            }

            $categoryBreakdown += "- **$subfolderFriendlyName**: $runbookCount runbooks"
        }

        # Add summary section
        $content += "`n## Summary`n`n"
        $content += "Total runbooks in this category: **$totalRunbooks**`n`n"

        if ($categoryBreakdown.Count -gt 0) {
            $content += "### Breakdown by Subcategory`n`n"
            $content += ($categoryBreakdown -join "`n")
            $content += "`n"
        }

        Set-Content -Path $readmePath -Value $content -Encoding UTF8 -NoNewline
    }

    function New-MainReadme {
        <#
        .SYNOPSIS
            Creates the main README.md file for runbook-references.

        .DESCRIPTION
            Generates comprehensive README.md with table of contents.

        .PARAMETER RunbookReferencesPath
            Path to the runbook-references directory.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$RunbookReferencesPath
        )

        $readmePath = Join-Path -Path $RunbookReferencesPath -ChildPath "README.md"

        # Start with header and intro text
        $content = @"
---
title: Runbook References
---

# Runbook References

This section contains detailed documentation for all available RealmJoin Runbooks.

The runbooks are automatically generated from the [realmjoin-runbooks](https://github.com/realmjoin/realmjoin-runbooks) repository and updated daily.

The runbooks are organized into different folders based on their area of application.

The following categories are currently available:

- device
- group
- org
- user

Each category contains multiple runbooks that are further divided into subcategories based on their functionality. The runbooks are listed in alphabetical order within each subcategory.

# RealmJoin runbook overview

In the following, each runbook is listed along with a brief description or synopsis to give a clear understanding of its purpose and functionality.
Also the document for each runbook contains information about permissions, where to find, notes, and parameters and further information in general.

## Table of contents

"@

        # Get all top-level folders
        $topFolders = Get-ChildItem -Path $RunbookReferencesPath -Directory | Sort-Object Name

        foreach ($topFolder in $topFolders) {
            $topFolderFriendly = Get-FriendlyName -Name $topFolder.Name
            $content += "- [$topFolderFriendly]($($topFolder.Name.ToLower())/README.md)`n`n"

            # Get subfolders
            $subfolders = Get-ChildItem -Path $topFolder.FullName -Directory | Sort-Object Name

            foreach ($subfolder in $subfolders) {
                $subfolderFriendly = Get-FriendlyName -Name $subfolder.Name
                $anchorName = "$($topFolder.Name.ToLower())-$($subfolder.Name.ToLower())"
                $content += "  - [$subfolderFriendly]($($topFolder.Name.ToLower())/README.md#$anchorName)`n`n"

                # Get all runbooks in this subfolder
                $runbooks = Get-ChildItem -Path $subfolder.FullName -Filter "*.md" |
                            Where-Object { $_.Name -ne "README.md" } |
                            Sort-Object Name

                foreach ($runbook in $runbooks) {
                    $runbookInfo = Get-RunbookInfo -FilePath $runbook.FullName
                    $relativePath = "$($topFolder.Name.ToLower())/$($subfolder.Name.ToLower())/$($runbook.Name)"
                    $content += "    - [$($runbookInfo.Title)]($relativePath)`n"
                }

                $content += "`n"
            }
        }

        Set-Content -Path $readmePath -Value $content -Encoding UTF8 -NoNewline
    }

    function New-ReadmeFile {
        <#
        .SYNOPSIS
            Creates a README.md file for a folder.

        .DESCRIPTION
            Generates a simple README.md with the folder name as title.

        .PARAMETER FolderPath
            The full path to the folder.

        .PARAMETER FolderName
            The name of the folder.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$FolderPath,

            [Parameter(Mandatory = $true)]
            [string]$FolderName
        )

        $friendlyName = Get-FriendlyName -Name $FolderName
        $readmePath = Join-Path -Path $FolderPath -ChildPath "README.md"

        $content = @"
---
title: $friendlyName
---

# $friendlyName

This section contains runbooks related to $($friendlyName.ToLower()).
"@

        Set-Content -Path $readmePath -Value $content -Encoding UTF8 -NoNewline
    }
    #endregion Helper Functions

    #region SUMMARY.md Update Functions
    ##############################

    function Get-SummaryContent {
        <#
        .SYNOPSIS
            Reads the current SUMMARY.md content.

        .DESCRIPTION
            Loads and returns the content of SUMMARY.md file.

        .PARAMETER Path
            Path to the SUMMARY.md file.

        .OUTPUTS
            String[]. Returns the lines of the SUMMARY.md file.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$Path
        )

        if (Test-Path -Path $Path) {
            $content = Get-Content -Path $Path -Encoding UTF8
            # Ensure we return an array, even if file is empty or has only one line
            if ($null -eq $content) {
                return @()
            } elseif ($content -is [string]) {
                return @($content)
            } else {
                return $content
            }
        } else {
            Write-Warning "SUMMARY.md file not found at: $Path"
            return @()
        }
    }    function Get-RunbookReferencesSection {
        <#
        .SYNOPSIS
            Generates the runbook references section content.

        .DESCRIPTION
            Creates the complete runbook references section for SUMMARY.md.

        .PARAMETER RunbookReferencesPath
            Path to the runbook-references directory.

        .OUTPUTS
            String[]. Returns the lines for the runbook references section.
        #>
        param (
            [Parameter(Mandatory = $true)]
            [string]$RunbookReferencesPath
        )

        $basePath = "automation/runbooks/runbook-references"
        $sectionLines = @()

        # Add main README entry
        $sectionLines += "  * [Runbook References]($basePath/README.md)"

        # Get folder structure
        $structure = Get-FolderStructure -Path $RunbookReferencesPath

        # Track folders at different levels
        $topLevelFolders = @()      # Device, Group, Org, User
        $subfolders = @()            # AVD, General, Security, etc.

        # Generate entries and categorize folders
        foreach ($item in $structure) {
            $entry = New-SummaryEntry -Item $item -BasePath $basePath
            $sectionLines += $entry

            if ($item.Type -eq "Folder") {
                if ($item.Depth -eq 0) {
                    # Top-level folder (Device, Group, Org, User)
                    $topLevelFolders += @{
                        Path = $item.FullPath
                        Name = $item.Name
                    }
                } elseif ($item.Depth -eq 1) {
                    # Subfolder (AVD, General, Security, etc.)
                    # We don't need special handling for these anymore
                }
            }
        }

        # Create README.md files for top-level folders with runbook listings
        foreach ($folder in $topLevelFolders) {
            Write-Host "Generating README for top-level folder: $($folder.Name)"
            New-SubfolderReadme -FolderPath $folder.Path -FolderName $folder.Name
        }

        # Create main README for runbook-references
        Write-Host "Generating main README for runbook-references"
        New-MainReadme -RunbookReferencesPath $RunbookReferencesPath

        return $sectionLines
    }

    function Update-SummaryMdContent {
        <#
        .SYNOPSIS
            Updates SUMMARY.md with new runbook references section.

        .DESCRIPTION
            Replaces only the runbook references section while preserving all other content.

        .PARAMETER CurrentLines
            Current lines from SUMMARY.md.

        .PARAMETER NewSectionLines
            New lines for the runbook references section.

        .OUTPUTS
            String[]. Returns the updated SUMMARY.md lines.
        #>
        param (
            [Parameter(Mandatory = $false)]
            [AllowEmptyCollection()]
            [string[]]$CurrentLines = @(),

            [Parameter(Mandatory = $true)]
            [string[]]$NewSectionLines
        )

        $updatedLines = @()
        $insideRunbookReferences = $false
        $runbookReferencesFound = $false
        $runbookReferencesIndent = 0

        for ($i = 0; $i -lt $CurrentLines.Count; $i++) {
            $line = $CurrentLines[$i]

            # Check if we're at the Runbook References line
            if ($line -match '^\s*\*\s*\[Runbook References\]') {
                $runbookReferencesFound = $true
                $insideRunbookReferences = $true

                # Calculate the indentation level
                if ($line -match '^(\s*)\*') {
                    $runbookReferencesIndent = $matches[1].Length
                }

                # Add the new section
                $updatedLines += $NewSectionLines
                continue
            }

            # Skip any orphaned runbook-references entries outside the section
            # (but not the main "Runbook References" line itself)
            if ($line -match 'automation/runbooks/runbook-references/' -and -not $insideRunbookReferences) {
                # Skip this line as it's an orphaned runbook reference
                continue
            }

            # If we're inside the runbook references section
            if ($insideRunbookReferences) {
                # Check if we've reached the end of the section
                # End is marked by a line that starts with * and has equal or less indentation
                if ($line -match '^(\s*)\*\s*\[') {
                    $currentIndent = $matches[1].Length
                    if ($currentIndent -le $runbookReferencesIndent) {
                        # We've reached a new section at the same or lower level
                        $insideRunbookReferences = $false
                        $updatedLines += $line
                    }
                }
                # Skip lines that are part of the old runbook references section
                continue
            }

            # Add all other lines
            $updatedLines += $line
        }

        # If runbook references section was not found, we need to add it
        if (-not $runbookReferencesFound) {
            Write-Warning "Runbook References section not found in SUMMARY.md"
            Write-Warning "Please add it manually or the section will not be updated."
        }

        return $updatedLines
    }
    #endregion SUMMARY.md Update Functions

#endregion Functions

############################################################
#region Main Logic
#
############################################################

    #region Initialization
    ##############################

    Write-Host "Starting SUMMARY.md update..."
    Write-Host "Runbook References Path: $RunbookReferencesPath"
    Write-Host "SUMMARY.md Path: $SummaryPath"

    # Check if runbook-references directory exists
    if (-not (Test-Path -Path $RunbookReferencesPath)) {
        throw "Runbook references directory not found: $RunbookReferencesPath"
    }
    #endregion Initialization

    #region Generate New Section
    ##############################

    Write-Host "Scanning runbook references directory..."
    $newSectionLines = Get-RunbookReferencesSection -RunbookReferencesPath $RunbookReferencesPath
    Write-Host "Generated $($newSectionLines.Count) lines for runbook references section."
    #endregion Generate New Section

    #region Update SUMMARY.md
    ##############################

    Write-Host "Reading current SUMMARY.md content..."
    $currentLines = Get-SummaryContent -Path $SummaryPath

    # Ensure currentLines is an array
    if ($null -eq $currentLines) {
        $currentLines = @()
    } elseif ($currentLines -isnot [array]) {
        $currentLines = @($currentLines)
    }

    Write-Host "Updating SUMMARY.md content..."
    $updatedLines = Update-SummaryMdContent -CurrentLines $currentLines -NewSectionLines $newSectionLines

    Write-Host "Writing updated SUMMARY.md..."
    Set-Content -Path $SummaryPath -Value $updatedLines -Encoding UTF8
    #endregion Update SUMMARY.md

#endregion Main Logic

############################################################
#region Completion
#
############################################################

Write-Host ""
Write-Host "SUMMARY.md update completed successfully!"

#endregion Completion
