---
type: Developer Reference
description: Send branded HTML report emails from Azure Automation runbooks via Microsoft Graph using Markdown content.
---

# Send-RjRbReportEmail

## Overview

`Send-RjRbReportEmail` is the standard helper for delivering report emails from RealmJoin reporting runbooks. It takes Markdown content, converts it to a RealmJoin-branded responsive HTML email, attaches optional files and inline branding graphics (header/footer), and sends the result through the Microsoft Graph `sendMail` endpoint.

> **Renamed in this release.** The function was renamed from `Send-RjReportEmail` to `Send-RjRbReportEmail` for naming consistency with the rest of the module (`*-RjRb*`). The old name `Send-RjReportEmail` is exported as a backwards-compatible alias, so existing runbooks keep working unchanged — but new runbooks should call `Send-RjRbReportEmail`.

Key characteristics:

- **Markdown in, HTML out** — runbooks compose the report body in Markdown; the function renders it to themed HTML that works across Outlook Classic, New Outlook, Outlook Web, mobile clients and dark mode.
- **One email per recipient** — when multiple recipients are supplied, the function sends an individual message to each address rather than a single multi-recipient mail. This is a privacy/BCC-by-default design.
- **Inline branded header & footer** — bundled PNG assets are sent as CID attachments and referenced by the embedded HTML. Both can be overridden or suppressed entirely.
- **Self-connecting** — if no Graph session is active, the function transparently calls `Connect-RjRbGraph` (or `Connect-MgGraph -Identity` when `-UseNativeGraphRequest` is set).
- **Resilient** — failed attachment reads, missing image overrides, or per-recipient sendMail failures are reported but do not abort the entire batch unless *all* recipients fail.

Centralized email settings (sender address, service desk info) are documented in [Runbook Report Settings](../../automation/runbooks/runbook-report-settings.md) — this document focuses on calling the function from a runbook.

## Prerequisites

### Sender mailbox

A licensed Microsoft 365 mailbox (typically a dedicated shared mailbox such as `realmjoin-report@contoso.com`) is required as the `From` address. The Automation Account's managed identity must be allowed to send on behalf of that mailbox via the Graph `Mail.Send` application permission (scoped via RBAC for Applications if you want to restrict the identity to a single mailbox).

### Graph permissions

| Scenario | Required permission |
|---|---|
| Default (`Invoke-RjRbRestMethodGraph`) | `Mail.Send` (Application) on the sender mailbox |
| With `-UseNativeGraphRequest` | Same — the call still hits `/users/{id}/sendMail` |

### Module connectivity

By default the function uses `Invoke-RjRbRestMethodGraph` from this module. If no connection is active it auto-connects via `Connect-RjRbGraph`. When `-UseNativeGraphRequest` is set, the function instead checks `Get-MgContext` and calls `Connect-MgGraph -Identity -NoWelcome` on demand.

## Quick Start

The minimum viable call requires only the sender, the recipient, a subject and the Markdown body:

```powershell
Send-RjRbReportEmail `
    -EmailFrom "realmjoin-report@contoso.com" `
    -EmailTo   "alice@contoso.com" `
    -Subject   "Weekly Report" `
    -MarkdownContent @"
# Weekly Report

Hello Alice,

here are this week's numbers:

- New devices enrolled: **42**
- License compliance: **98%**
"@
```

This produces a fully branded RealmJoin email with the default header and footer, light/dark mode support, and the tenant/version block in the footer.

## Parameters

### Required

| Parameter | Type | Description |
|---|---|---|
| `EmailFrom` | `string` | User principal name or object id of the sender mailbox. Used as `/users/{id}/sendMail`. |
| `EmailTo` | `string` | Recipient address. **Single string** — multiple addresses are passed as a comma-separated list, see below. |
| `Subject` | `string` | Subject line. Also injected into the HTML `<title>` element. |
| `MarkdownContent` | `string` | Report body in Markdown. See [Markdown Support](#markdown-support) for the supported syntax. |

### Optional — Content

| Parameter | Type | Default | Description |
|---|---|---|---|
| `Attachments` | `string[]` | `@()` | Local file paths to attach. Missing files are logged and skipped, unreadable files emit a warning but do not abort the send. MIME type is derived from the file extension. |
| `saveToSentItems` | `bool` | `$true` | If `$true` the sent message is kept in the sender mailbox's *Sent Items*. Set to `$false` for high-volume reporting to avoid filling the mailbox. |
| `TenantDisplayName` | `string` | — | Shown in the tenant-info box embedded at the end of the content area. |
| `ReportVersion` | `string` | — | Shown in the tenant-info box (use semantic version strings, build numbers, or a runbook name + date). |

### Optional — Branding

| Parameter | Type | Default | Description |
|---|---|---|---|
| `HeaderImage` | `string` | bundled `Assets/Header.png` | Local file path to a PNG/JPG/GIF that overrides the default header graphic. **The runbook must resolve any URL/blob to a local file beforehand** (e.g. via `Get-AzStorageBlobContent`). Missing/unreadable overrides fall back to the bundled default and emit a warning. |
| `FooterImage` | `string` | bundled `Assets/Footer.png` | Same handling as `HeaderImage`. The footer is rendered as a single clickable image — any branding text, logo or URL must be baked into the PNG. |
| `FooterLink` | `string` | `https://www.realmjoin.com` | URL used as the `href` and `title` of the anchor wrapping the footer image. |
| `NoHeader` | `switch` | off | Suppresses the header graphic entirely. If combined with `HeaderImage`, a warning is emitted and the override is ignored. |
| `NoFooter` | `switch` | off | Suppresses the footer graphic and its link entirely. If combined with `FooterImage` or a custom `FooterLink`, a warning is emitted and those values are ignored. |

**Recommended image dimensions:** 750 × 200 px PNG. This matches the email container width and the bundled defaults. Significantly different aspect ratios may look distorted on narrow viewports. Each graphic should stay well below 3 MB — Graph caps the total `sendMail` request at 4 MB and a warning is emitted if either image exceeds 3 MB.

### Optional — Transport

| Parameter | Type | Default | Description |
|---|---|---|---|
| `UseNativeGraphRequest` | `switch` | off | Sends via `Invoke-MgGraphRequest` (requires `Microsoft.Graph` module and a `Connect-MgGraph` session) instead of `Invoke-RjRbRestMethodGraph`. Use this when the runbook is built around the native SDK rather than the RealmJoin wrapper. |

## Usage Examples

### Multiple recipients

`EmailTo` accepts a single string containing one or more comma-separated addresses. Each address is trimmed, empty entries are removed, and **one individual email is sent per recipient** — recipients do not see each other.

```powershell
Send-RjRbReportEmail `
    -EmailFrom "realmjoin-report@contoso.com" `
    -EmailTo   "alice@contoso.com, bob@contoso.com, team-lead@contoso.com" `
    -Subject   "Monthly Inventory" `
    -MarkdownContent $reportMd
```

### With attachments and tenant metadata

```powershell
$csvPath = Join-Path $env:TEMP 'devices.csv'
$exportData | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

Send-RjRbReportEmail `
    -EmailFrom         "realmjoin-report@contoso.com" `
    -EmailTo           "it-reports@contoso.com" `
    -Subject           "Device Inventory — $(Get-Date -Format 'yyyy-MM-dd')" `
    -MarkdownContent   $reportMd `
    -Attachments       @($csvPath, "$env:TEMP\summary.xlsx") `
    -TenantDisplayName "Contoso Ltd" `
    -ReportVersion     "DeviceInventory v1.4.2"
```

The attached files are listed in an "Attached Files" box at the bottom of the email body, in addition to being added as real attachments to the message.

### Custom header/footer branding

Bring your own branding by downloading the assets to a local path first, then pass the resulting paths. The function does not fetch URLs itself.

```powershell
# Resolve branding assets from Azure Blob Storage to the runbook's temp folder
$headerPath = Join-Path $env:TEMP 'contoso-header.png'
$footerPath = Join-Path $env:TEMP 'contoso-footer.png'

Get-AzStorageBlobContent -Container 'branding' -Blob 'header.png' -Destination $headerPath -Force | Out-Null
Get-AzStorageBlobContent -Container 'branding' -Blob 'footer.png' -Destination $footerPath -Force | Out-Null

Send-RjRbReportEmail `
    -EmailFrom        "realmjoin-report@contoso.com" `
    -EmailTo          "alice@contoso.com" `
    -Subject          "Branded Report" `
    -MarkdownContent  $reportMd `
    -HeaderImage      $headerPath `
    -FooterImage      $footerPath `
    -FooterLink       "https://intranet.contoso.com/it-reports"
```

If `$headerPath` is missing or unreadable, the call still succeeds — the bundled RealmJoin default is used and a warning is logged.

### Plain content (no header/footer)

For alert-style notifications that should not look like a marketing email:

```powershell
Send-RjRbReportEmail `
    -EmailFrom       "realmjoin-report@contoso.com" `
    -EmailTo         "oncall@contoso.com" `
    -Subject         "[ALERT] License threshold exceeded" `
    -MarkdownContent "## License threshold exceeded`n`nSee dashboard for details." `
    -NoHeader `
    -NoFooter
```

### Using the native Microsoft.Graph SDK

If the runbook is already authenticated through `Connect-MgGraph` (managed identity) and you prefer not to mix in the RealmJoin wrapper:

```powershell
Connect-MgGraph -Identity -NoWelcome

Send-RjRbReportEmail `
    -EmailFrom             "realmjoin-report@contoso.com" `
    -EmailTo               "alice@contoso.com" `
    -Subject               "Native Graph send" `
    -MarkdownContent       $reportMd `
    -UseNativeGraphRequest
```

### Reading the report body from a file

For larger reports, generate the Markdown to a `.md` file and read it in:

```powershell
$reportMd = Get-Content -Path .\generated-report.md -Raw

Send-RjRbReportEmail `
    -EmailFrom       "realmjoin-report@contoso.com" `
    -EmailTo         "alice@contoso.com" `
    -Subject         "Weekly Report" `
    -MarkdownContent $reportMd
```

### Action buttons (call-to-action)

Render one or more branded buttons by appending `{button}` to a Markdown link. Buttons placed on the same line are grouped into a single row:

```powershell
$reportMd = @"
# Access request

A new device access request is awaiting your decision.

[Approve](https://portal.contoso.com/approve/123){button} [Reject](https://portal.contoso.com/reject/123){button}
"@

Send-RjRbReportEmail `
    -EmailFrom       "realmjoin-report@contoso.com" `
    -EmailTo         "approver@contoso.com" `
    -Subject         "Action required: device access request" `
    -MarkdownContent $reportMd
```

Each button is a normal hyperlink styled as a CTA — safe in all clients, with rounded corners in modern clients and square corners in Outlook Classic.

## Markdown Support

The function ships with a built-in lightweight Markdown → HTML converter. **No external Markdown module is required.** Supported syntax:

| Markdown | Notes |
|---|---|
| `# … ######` headings | All six levels. Space after `#` is optional. `h1` gets an underline; spacing tuned for Outlook. |
| `**bold**`, `*italic*`, `~~strike~~` | Inline-only (must not span multiple lines). |
| `` `inline code` `` | Rendered as `<code>` with a light grey background. |
| ``` ```lang ... ``` ``` fenced code blocks | Language tag is preserved as `class="language-…"`. Also tolerates malformed single-backtick fences. |
| `[text](url)` links | Open in new tab with `noopener noreferrer`. |
| `[label](url){button}` link buttons | Rendered as a branded orange call-to-action button instead of a plain link. Multiple `{button}` links on the **same line** render side by side in one row (width split equally). Rounded corners show in modern clients (New Outlook, OWA, mobile); Outlook Classic (Word engine) renders square corners. |
| `![alt](url)` images | Inserted as `<img>` (no inline-attachment magic — the URL must be reachable by the mail client). |
| `- item` / `1. item` lists | Nested lists supported via 2-space indentation per level. Mixing ordered and unordered closes the previous list. |
| Multi-line list items | An indented, non-empty line directly under a `<li>` is folded into the same item with a `<br>` soft break — no need to keep each item on one line. |
| `- [ ]` / `- [x]` task lists | Rendered as `☐` / `☑` Unicode glyphs (green when checked). `<input type="checkbox">` is intentionally avoided because Outlook Classic strips form controls. Capital `[X]` also counts as checked. |
| `> blockquote` | Rendered with a coloured left border and shaded background. |
| `> [!NOTE\|TIP\|IMPORTANT\|WARNING\|CAUTION]` | GitHub-style admonitions. First line of the blockquote is the marker (alone), the remaining `>`-prefixed lines are the body. Each type gets its own accent colour, glyph and title bar. |
| `---`, `***`, `___` | Horizontal rule. |
| `\|col\|col\|` tables | Standard pipe tables with `:---`, `:---:`, `---:` alignment specifiers. Header row + separator required. |
| `\\` escaping | `\*`, `\|` etc. are honoured so literal Markdown characters can be emitted. |

Items not supported include footnotes, definition lists, and HTML pass-through — keep the Markdown to the table above.

## Behavior & Error Handling

### Recipient parsing

`EmailTo` is split on commas, each entry is trimmed and empty entries are dropped. If the resulting list is empty the function throws `No valid email recipients found in EmailTo parameter.` before any Graph call is made.

### Per-recipient failures

Each recipient is sent independently. The function tracks successes and failures:

- If **at least one** send succeeds but others fail, a warning is emitted listing the failed addresses; the function returns normally.
- If **all** sends fail, the function throws `Failed to send email to all recipients: …` so the runbook fails loudly.

### Attachment failures

- Missing files (path does not exist) — logged verbosely, silently skipped.
- Existing but unreadable files (locked, permission denied) — warning emitted, skipped, the rest of the call proceeds.
- The "Attached Files" box at the bottom of the email lists only attachments that were successfully read.

### Image override failures

Both `HeaderImage` and `FooterImage` fall back to the bundled defaults on any error (missing file, unsupported extension, IO error). A warning describes the failure and identifies which default was used.

### Total size limit

Graph caps `sendMail` requests at ~4 MB combined (HTML body + all attachments, base64-encoded). The function emits a warning when either branding image exceeds 3 MB. If the total payload still exceeds 4 MB the Graph call itself will fail; consider:

- Uploading large data to the Storage Account channel instead — see [Runbook Report Settings](../../automation/runbooks/runbook-report-settings.md#storage-account-delivery).
- Linking to externally hosted attachments rather than embedding them.
- Compressing tabular data (`Compress-Archive`) before attaching.

## Integration with Runbook Report Settings

Reporting runbooks typically resolve the sender address from the central RealmJoin customization JSON rather than hard-coding it. The relevant settings are documented in [Runbook Report Settings](../../automation/runbooks/runbook-report-settings.md). A typical resolution pattern in a runbook looks like:

```powershell
# Read centralized settings (resolved by the runbook framework)
$emailFrom = (Get-RjRbDefaultValue -Name 'EmailSender' -Section 'RJReport')

if (-not $emailFrom) {
    throw "No EmailSender configured. See https://docs.realmjoin.com/ for setup instructions."
}

Send-RjRbReportEmail `
    -EmailFrom       $emailFrom `
    -EmailTo         $RecipientParameter `
    -Subject         $Subject `
    -MarkdownContent $reportMd `
    -TenantDisplayName $TenantDisplayName `
    -ReportVersion     "MyReport v1.0"
```

## Outputs

The function returns nothing on success. All progress is written via `Write-RjRbLog -Verbose` (visible when the runbook is run with `-Verbose` or `$VerbosePreference = 'Continue'`). Warnings are forced through `$WarningPreference = 'Continue'` regardless of caller-side overrides, so they reliably appear in the Azure Automation job stream.

## Related Exported Helpers

The building blocks behind `Send-RjRbReportEmail` are now exported from the module too, so runbooks can compose or preview the HTML without sending:

| Function | Purpose |
| --- | --- |
| `ConvertFrom-RjRbMarkdownToHtml` | Standalone Markdown → HTML converter (the same lightweight engine used internally, including the `{button}` syntax). |
| `Get-RjRbReportEmailBody` | Assembles the full branded HTML body (header/footer, tenant-info box, attachment list) from HTML or Markdown — useful to render and inspect the email before sending. |
| `Resolve-RjRbImageSource` | Resolves a header/footer image path to its inline CID source, falling back to the bundled default on error. |

These are primarily intended for advanced/testing scenarios; the normal path is to call `Send-RjRbReportEmail` directly.

## See Also

- [Runbook Report Settings](../../automation/runbooks/runbook-report-settings.md) — central configuration of the sender mailbox, service desk info, and Storage Account delivery channel.
- Microsoft Graph: [Send mail](https://learn.microsoft.com/en-us/graph/api/user-sendmail) — underlying API.
