---
type: Developer Reference
description: Export objects from Azure Automation runbooks to styled native Excel workbooks (.xlsx) without any external module dependencies.
---

# Export-RjRbXlsx

## Overview

`Export-RjRbXlsx` is the standard helper for producing Excel report files (`.xlsx`) from RealmJoin reporting runbooks. It writes one or more tables of `PSCustomObject`s as a **native Excel workbook** using only .NET (`System.IO.Compression`) — no `ImportExcel`, no COM automation, no other external module is required in the Automation environment.

{% hint style="warning" %}
**Not yet part of RealmJoin.RunbookHelper.** `Export-RjRbXlsx` is not yet shipped with the **RealmJoin.RunbookHelper** module — it will be included with the **next module release**. Until then, the function is duplicated inline in the runbooks that use it and can be copied from there, for example from [sync-MFA-secure-users-to-group_scheduled.ps1](https://github.com/realmjoin/realmjoin-runbooks/blob/master/org/security/sync-MFA-secure-users-to-group_scheduled.ps1) (region *Function Definitions*).
{% endhint %}

Key characteristics:

- **Zero module dependencies** — the workbook is assembled directly as an Open XML package via `System.IO.Compression.ZipArchive`. This avoids both the cold-start cost of heavyweight modules and assembly conflicts in mixed reporting runbooks.
- **Styled, ready-to-share output** — each worksheet gets a styled Excel table (navy header, zebra rows that follow re-sorting, filter dropdowns), a frozen header row, calculated column widths and an automatic print setup (orientation derived from content width, header row repeated on every printed page). The first worksheet tab is colored RealmJoin orange.
- **Type-faithful cells** — .NET numbers become Excel numbers, `DateTime` values and ISO-8601 strings (e.g. Graph date fields) become real, sortable Excel dates (localized by the client), and `http/https` URLs become clickable hyperlinks. All other strings stay text — values like serial numbers or IMEIs are never converted to numbers, and **formula injection is not possible**.
- **Single- or multi-worksheet** — pipe rows into a single sheet, or pass an ordered dictionary for a workbook with multiple worksheets plus an optional "Info" cover sheet.
- **Report polish built in** — optional conditional-formatting highlight rules for status columns, in-cell data bars for numeric columns, friendly hyperlink display text, and thousands separators.

A typical consumer is a scheduled reporting runbook that generates CSV and XLSX files and then delivers them via [Send-RjRbReportEmail](send-rjrbreportemail.md) and/or [Publish-RjRbFilesToStorageContainer](publish-rjrbfilestostoragecontainer.md).

## Prerequisites

None beyond PowerShell itself. The function only uses .NET types available in every Azure Automation runtime (`System.IO.Compression`, `System.Text`, `System.Xml`-free string building). No Graph or Az connection is required — the function works purely on local data and writes a local file.

## Quick Start

The minimum viable call pipes the rows into the function and specifies the output path:

```powershell
$devices | Export-RjRbXlsx -Path (Join-Path $env:TEMP 'devices.xlsx') -WorksheetName 'Devices'
```

This produces a workbook with a single "Devices" worksheet: styled table with filter dropdowns, frozen header row, auto-sized columns and print setup — ready to attach to a report email or upload to a storage container.

## Parameters

### Parameter sets

The function has two parameter sets:

| Parameter set | Input | Use case |
|---|---|---|
| `SingleSheet` (default) | `-InputObject` (also via pipeline) + `-WorksheetName` | One table, one worksheet. |
| `MultiSheet` | `-Worksheets` (ordered dictionary) | Several tables as separate worksheets in one workbook. |

### Required

| Parameter | Type | Description |
|---|---|---|
| `Path` | `string` | Full path of the `.xlsx` file to create. **An existing file is overwritten.** |

### Data input

| Parameter | Type | Parameter set | Description |
|---|---|---|---|
| `InputObject` | `object[]` | `SingleSheet` | The rows to export (array of objects; also accepted via pipeline). Column order follows the property order of the first object. Dictionaries/hashtables are converted to objects. |
| `WorksheetName` | `string` | `SingleSheet` | Name of the single worksheet. Default: `Report`. |
| `Worksheets` | `IDictionary` | `MultiSheet` | Ordered dictionary of worksheet name → rows, e.g. `([ordered]@{ 'Summary' = $summary; 'Details' = $details })`. Must contain at least one entry. |

### Optional — Content & formatting

| Parameter | Type | Default | Description |
|---|---|---|---|
| `CoverSheet` | `IDictionary` | — | Ordered dictionary rendered as an "Info" cover worksheet (first tab): a `Title` key becomes the heading, all other keys become label/value rows, e.g. `([ordered]@{ Title = 'Device Report'; Tenant = 'contoso'; Generated = '2026-07-16 08:00 UTC' })`. |
| `HighlightRules` | `object[]` | — | Conditional formatting for status columns. Array of hashtables with `Column` (header name), `Value` (exact cell text, case-insensitive) and `Color` (`Green`, `Red` or `Yellow` — the classic Excel highlight presets). Rules are applied on every worksheet that contains the named column. |
| `DataBarColumns` | `object[]` | — | Numeric column names that get an in-cell data bar (orange, min-to-max gradient), e.g. `@('DeviceCount')`. Columns that do not exist on a worksheet are skipped. |
| `HyperlinkText` | `IDictionary` | — | Column name → display text for hyperlink cells, e.g. `@{ Portal = 'Open in Intune' }`. The cell shows the friendly text, the link target stays the full URL. Columns without a mapping keep showing the URL. |
| `NoHyperlink` | `switch` | off | Do not convert `http/https` URL strings into clickable hyperlinks. |
| `HideGridLines` | `switch` | off | Hide the worksheet grid lines outside the table (grid lines are kept by default for readability; the cover sheet always hides them). |
| `UseThousandsSeparator` | `switch` | off | Format numeric cells with a thousands separator (`#,##0` for integers, `#,##0.00` for decimals — localized by Excel). |

## Usage Examples

### Multiple worksheets

```powershell
Export-RjRbXlsx `
    -Worksheets ([ordered]@{ 'Summary' = $summaryRows; 'Details' = $detailRows }) `
    -Path (Join-Path $env:TEMP 'report.xlsx')
```

Worksheet tabs appear in dictionary order; the first tab is colored RealmJoin orange, the remaining tabs neutral gray.

### Cover sheet, highlight rules and data bars

The full "report workbook" pattern with an info cover sheet, colored status columns and in-cell data bars:

```powershell
$coverSheet = [ordered]@{
    Title             = 'Device Report'
    'Tenant'          = $tenantDisplayName
    'Generated (UTC)' = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd HH:mm')
    'Runbook version' = $Version
    'Devices total'   = "$($devices.Count)"
}

Export-RjRbXlsx `
    -Worksheets      ([ordered]@{ 'Devices' = $devices }) `
    -Path            (Join-Path $env:TEMP 'device-report.xlsx') `
    -CoverSheet      $coverSheet `
    -HighlightRules  @(
        @{ Column = 'Compliant'; Value = 'yes'; Color = 'Green' },
        @{ Column = 'Compliant'; Value = 'no';  Color = 'Red' }
    ) `
    -DataBarColumns  @('AppCount')
```

The cover sheet is inserted as the first tab named "Info", with the `Title` value as a navy heading over an orange accent line and all other keys as label/value rows.

### Friendly hyperlink text

URL columns are clickable by default and show the raw URL. Map a column to a friendly display text to keep the table narrow:

```powershell
$rows = $devices | Select-Object DeviceName, SerialNumber, @{
    n = 'Portal'
    e = { "https://intune.microsoft.com/#view/Microsoft_Intune_Devices/DeviceSettingsMenuBlade/~/overview/mdmDeviceId/$($_.id)" }
}

$rows | Export-RjRbXlsx -Path $xlsxPath -WorksheetName 'Devices' -HyperlinkText @{ Portal = 'Open in Intune' }
```

### Combining with the delivery helpers

A common end-to-end pattern in reporting runbooks — write the workbook, then attach it to a report email and/or upload it for a download link:

```powershell
$xlsxPath = Join-Path $env:TEMP 'report.xlsx'
Export-RjRbXlsx -Worksheets ([ordered]@{ Changes = $changeRows; 'All Users' = $allUserRows }) `
    -Path $xlsxPath -CoverSheet $coverSheet

# Email delivery — the compact workbook is ideal as a size-limit fallback attachment
Send-RjRbReportEmail `
    -EmailFrom       $emailFrom `
    -EmailTo         $EmailTo `
    -Subject         "Report — $(Get-Date -Format 'yyyy-MM-dd')" `
    -MarkdownContent $reportMd `
    -Attachments     @($xlsxPath)

# ...or storage delivery with a time-limited download link
$uploaded = Publish-RjRbFilesToStorageContainer `
    -FilePaths          $xlsxPath `
    -ContainerName      'reports' `
    -ResourceGroupName  $ResourceGroupName `
    -StorageAccountName $StorageAccountName `
    -AddBlobNamePrefix  $true
```

See [Send-RjRbReportEmail](send-rjrbreportemail.md) and [Publish-RjRbFilesToStorageContainer](publish-rjrbfilestostoragecontainer.md) for the delivery side of this pattern.

## Cell Type Handling

| Input value | Rendered as |
|---|---|
| .NET integer/floating-point/decimal types | Excel number (optionally with thousands separator via `-UseThousandsSeparator`). `NaN`/`Infinity` fall back to text. |
| `[datetime]` | Real Excel date; date-only values get a date format, values with a time component get a date-time format. Localized by the viewing client. |
| ISO-8601 date strings (`2026-07-16T08:00:00Z`, typical Graph date fields) | Parsed and rendered as real, sortable Excel dates. |
| `[bool]` | Excel boolean (`TRUE`/`FALSE`). |
| `http://` / `https://` URL strings | Clickable hyperlink (suppress with `-NoHyperlink`; display text via `-HyperlinkText`). |
| Arrays / collections | Items joined with `; ` into one text cell. |
| `$null` / `DBNull` | Empty cell. |
| Everything else | Plain text. Leading/trailing whitespace is preserved; strings are never re-interpreted as numbers or formulas. |

## Behavior & Error Handling

### Worksheet names

Worksheet names are sanitized to comply with Excel's rules: invalid characters (`[ ] : * ? / \`) are replaced, names are truncated to 31 characters, empty names become `Sheet<n>`, and duplicates get a `_2`, `_3`, … suffix.

### Column headers

Header names come from the property order of the first row object. Empty property names become `Column<n>`; duplicate names (case-insensitive) are deduplicated with a `_2`, `_3`, … suffix, because Excel table columns must be unique and non-empty.

### Empty worksheets

A worksheet whose row set is empty is still written — it contains a single "No data available" cell and no table. An empty `-Worksheets` dictionary, however, throws `Export-RjRbXlsx: -Worksheets must contain at least one entry.`

### Row limit

Excel caps worksheets at 1,048,576 rows. The function throws `Export-RjRbXlsx: worksheet '<name>' has <n> rows - the xlsx limit is 1048575 data rows.` before writing an invalid file. Split very large exports across multiple worksheets or deliver them as CSV instead.

### Highlight rules

- Rules referencing a column that does not exist on a worksheet are silently skipped for that worksheet (they still apply to other worksheets that have the column).
- An unknown `Color` value emits `Export-RjRbXlsx: unknown highlight color '<color>' - use Green, Red or Yellow. Skipping rule.` as a warning and skips only that rule.

### Column widths

Widths are calculated from the header length and the first 1,000 data rows (clamped between 8 and 60 characters), so very large exports do not slow down on width calculation.

### Output file

An existing file at `Path` is deleted and re-created. The function does not create missing parent directories — ensure the target folder exists (e.g. `New-Item -ItemType Directory`).

## Outputs

The function returns nothing. It writes the workbook to `Path` and emits a verbose message (`Export-RjRbXlsx: wrote <n> worksheet(s) to <path>`) visible when the runbook runs with `-Verbose` or `$VerbosePreference = 'Continue'`.

## See Also

- [Send-RjRbReportEmail](send-rjrbreportemail.md) — deliver the generated workbook as a report email attachment.
- [Publish-RjRbFilesToStorageContainer](publish-rjrbfilestostoragecontainer.md) — upload the workbook to Azure Blob Storage and return a time-limited download link.
- [Runbook Report Settings](../../automation/runbooks/runbook-report-settings.md) — central configuration of the report delivery channels.
- Example inline usage: [sync-MFA-secure-users-to-group_scheduled.ps1](https://github.com/realmjoin/realmjoin-runbooks/blob/master/org/security/sync-MFA-secure-users-to-group_scheduled.ps1) — the runbook currently carrying the function until it ships with the module.
