---
type: Developer Reference
description: Render runbook results as sortable, filterable tables in the RealmJoin Portal, and write runbooks that emit structured objects.
---

# Runbook Output Data

## Overview

**Output Data** is the structured counterpart to the **Console** tab on a runbook job page. The console keeps the raw, line-by-line text feed of a run; Output Data renders the objects the same run emitted as tables. Long values such as GUIDs are shown in full instead of being truncated to `…` by the PowerShell console formatter, and wide result sets stay readable instead of wrapping.

Key characteristics:

- **No configuration, no additional permissions** — the tab is available for every runbook that emits objects. Nothing has to be enabled, and who may start a runbook is unaffected.
- **Objects instead of pre-formatted text** — the tables are built from what the runbook writes to the output stream. A runbook that pre-formats its results with `Format-Table` produces no Output Data at all.
- **Interactive tables** — every table can be sorted, filtered, paged and exported to Excel or CSV independently of the others.
- **Nested data stays inspectable** — objects and arrays inside a cell are expandable rather than flattened into one unreadable string.
- **The Console tab is unchanged** — the full text output remains available and copyable, which is what a service or ITIL ticket usually needs.

## Quick Start

The minimum viable runbook emits a marker object with the table name, then the data:

```powershell
[PSCustomObject]@{ RjTableTitle = 'Non-compliant devices' }
Write-Output $nonCompliantDevices
```

This produces one table titled **Non-compliant devices** in the Output Data tab — one row per device, one column per property — plus a compact summary line in the Console tab that links to it.

## Reading Output Data in the Portal

Open a job from [Runbook Logs](../automation/runbooks/runbook-logs/) and switch to the **Output Data** tab. See [Runbook Job Details](../automation/runbooks/runbook-logs/runbook-job-details.md) for the other tabs of that page.

### Tables and navigation

Each set of objects a runbook emits becomes one table. A table carries:

- **A title** — either the name the runbook set (see [Naming a table](#naming-a-table)) or the fallback `Table 1`, `Table 2` and so on.
- **A sidebar entry** — every table is listed on the left; clicking a title jumps to it.
- **A row counter** — `12 / 340 rows` shows how many rows match the current filter out of the table total.

### Filter

The **Filter…** box above a table keeps only the rows that contain the entered text. The filter is a case-insensitive substring match across all columns of that table. Each table filters independently.

### Sort

Clicking a column header sorts by that column; clicking it again reverses the direction. An arrow (`▲` / `▼`) marks the active column. Sorting is type-aware:

| Column content | Sort order |
|---|---|
| Numbers | Numeric — `2` before `10`. |
| Dates | Chronological. |
| Everything else | Alphabetical, case-insensitive. |

Empty cells sort first.

### Paging

Tables page at 50 rows, with a pager below the table. Filter and sort always apply to the whole table, not only to the page currently shown.

### Nested objects and lists

A cell holding a nested object or array is not flattened into unreadable text:

- The cell shows a caret (`▸`). Clicking it expands that object or array inline underneath the row.
- The column header carries an expand arrow. Clicking it expands the whole column into its own table: each parent row's nested value is exploded into rows, and a reference column links back to the parent row number. The new table is appended at the bottom of the page and to the sidebar, and can be filtered, sorted and exported like any other.

### Export

Each table has its own **Export to Excel** (`.xlsx`) and **Export to CSV** buttons. Exports honour the active filter — only matching rows are written — and use the table title as the file name.

Exporting from the portal covers the ad-hoc case. For report files that a runbook is supposed to deliver on its own — as a mail attachment or as a download link — build them in the runbook instead, with [Export-RjRbXlsx](report-functions/export-rjrbxlsx.md) and the delivery helpers.

## Console Tab

When a job emitted tables, the **Console** tab shows a compressed view by default. Tables are drawn PowerShell-style but truncated, so that status lines stay readable and a runbook that emitted hundreds of objects does not flood the page. In place of each table, the console shows a summary box:

```plaintext
╭─ Table ────────────────────────────────────────────╮
│ <table name> · <row count> rows                    │
╰───────────────────────────── → "Output Data" tab ──╯
```

Tables emitted in direct succession share one box:

```plaintext
╭─ Table ────────────────────────────────────────────╮
│ Devices                 · 3123 rows                │
│ Application credentials · 42 rows                  │
│ Large export sample     · 987654 rows              │
╰───────────────────────────── → "Output Data" tab ──╯
```

`→ "Output Data" tab` is a link and switches to the corresponding table.

Two buttons control the view:

- **Show full output** — switch to the complete, untruncated text.
- **Show compressed tables** — switch back.

**Copy to Clipboard** always copies the full raw output, regardless of which view is shown.

## Emitting Output Data from a Runbook

The tab is built from the objects a runbook emits. Clean tables therefore require the runbook to write objects rather than pre-format them into text.

### Emit objects, not formatted text

> **Never pipe output through `Format-Table` or `Format-List`.** Those cmdlets emit formatting-engine records, not data. The portal detects and hides them, and shows a hint that the output was misformatted. The same applies wherever PowerShell auto-formats a result because it was written to the host instead of to the output stream.

`Format-*` cmdlets only ever control *display*. What they were used for has a data equivalent that Output Data can render — picking columns in particular is what `Select-Object` does:

| Instead of | Use |
|---|---|
| `$devices \| Format-Table Name, Id` | `$devices \| Select-Object Name, Id` |
| `$devices \| Format-Table -AutoSize` | `Write-Output $devices` |
| `$devices \| Format-List` | `Write-Output $devices` |

`Select-Object Name, Id` yields the same column selection that `Format-Table Name, Id` would have displayed — but it emits objects, so the columns survive into the Output Data tab instead of being dropped as formatting records:

```powershell
# Good — real objects, columns chosen with Select-Object
$devices | Select-Object Name, Id, OperatingSystem, LastSeen

# Bad — formatting records, hidden from Output Data
$devices | Format-Table Name, Id, OperatingSystem, LastSeen
```

The selected properties are exactly the columns of the resulting table: `Name`, `Id`, `OperatingSystem` and `LastSeen`, one row per device.

### How objects become tables

| Emitted | Rendered as |
|---|---|
| One object | One row — its properties become the columns. |
| Consecutive objects with the same properties | One table. |
| An object with a different set of properties | A new table starts. |
| A single plain value (string, number) | A text line in the console, not a table. |
| A line starting with `##` followed by a space | A header in the console view. |
| A nested object or array | JSON in the cell, expandable in the grid — see [Nested objects and lists](#nested-objects-and-lists). |

### Naming a table

By default, tables are labelled `Table 1`, `Table 2` and so on. To give a table a meaningful name, the runbook emits a marker object immediately before the data. The marker is a single-property object whose only property is `RjTableTitle`:

```powershell
[PSCustomObject]@{ RjTableTitle = 'Non-compliant devices' }
Write-Output $nonCompliantDevices
```

The following table is then titled **Non-compliant devices** — in the heading, in the sidebar and in the export file name.

- The marker itself is **consumed**. It appears neither as a row nor as a console line.
- The property name is **case-insensitive** — `RjTableTitle`, `rjtabletitle` and any other casing work.
- A **blank** title is ignored, so an empty marker cannot wipe an existing name.
- The name applies to the **next** table emitted, even when status lines appear in between.

Repeating the pattern names several tables in one run:

```powershell
[PSCustomObject]@{ RjTableTitle = 'Compliant devices' }
Write-Output $compliant

[PSCustomObject]@{ RjTableTitle = 'Non-compliant devices' }
Write-Output $nonCompliant
```

## Behavior & Limitations

### Archived jobs

Output Data is available for live runs only. An archived job shows *"Structured data can't be retrieved from an archived run."* — those results have to be read from the Console tab. See [Runbook Logs](../automation/runbooks/runbook-logs/) for the distinction between recent and archived job logs.

### Runbooks without structured output

*"No structured output data from this runbook."* means that nothing table-shaped was emitted. If an information icon accompanies the message, the runbook sent PowerShell formatting records instead of data — see [Emit objects, not formatted text](#emit-objects-not-formatted-text).

### Single values

A runbook that emits a single plain value — a status string, a count — keeps that value as a text line in the Console tab. Only objects become tables, so progress and status messages do not each turn into a one-row table.

## See Also

- [Runbook Job Details](../automation/runbooks/runbook-logs/runbook-job-details.md) — the job page that hosts the Console and Output Data tabs.
- [Export-RjRbXlsx](report-functions/export-rjrbxlsx.md) — write the same objects to a styled Excel workbook for delivery outside the portal.
- [Send-RjRbReportEmail](report-functions/send-rjrbreportemail.md) — deliver report results to administrators by email.
- [Interacting with Runbooks](interacting-with-runbooks.md) — read job output programmatically through the RealmJoin API.
