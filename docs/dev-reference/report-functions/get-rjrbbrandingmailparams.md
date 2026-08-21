---
type: Developer Reference
description: Resolve the RJReport.Branding tenant settings into ready-to-use parameters for Send-RjRbReportEmail.
---

# Get-RjRbBrandingMailParams

## Overview

`Get-RjRbBrandingMailParams` bridges the gap between the central [Email Branding settings](../../automation/runbooks/runbook-report-settings.md#email-branding-optional) and [`Send-RjRbReportEmail`](send-rjrbreportemail.md): the settings hold **URLs**, the send function expects **local file paths**. This function downloads the configured images, validates them, and returns a hashtable that can be splatted directly into the send call.

> **Available from RealmJoin.RunbookHelper 0.8.9.** Earlier runbook versions carried this logic as an inline helper of the same name; those copies can be deleted once the Automation Account runs 0.8.9 or later.

Design rules:

- **Never fails the report.** Any problem — empty setting, non-HTTPS URL, failed download, oversized file, invalid image, malformed color — results in a warning and the omission of that single key. The email is then rendered with the corresponding RealmJoin default.
- **Returns only what resolved.** The returned hashtable contains just the keys that succeeded, so splatting it never overrides a default with an empty value.
- **One download per run.** Call it once and reuse the result for every email the runbook sends — including inside loops that notify many users.

## Quick Start

```powershell
$brandingMailParams = Get-RjRbBrandingMailParams `
    -HeaderImageUrl $BrandingHeaderImageUrl `
    -FooterImageUrl $BrandingFooterImageUrl `
    -FooterLink     $BrandingFooterLink `
    -AccentColor    $BrandingAccentColor `
    -TextColor      $BrandingTextColor

Send-RjRbReportEmail `
    -EmailFrom       $EmailFrom `
    -EmailTo         $EmailTo `
    -Subject         $Subject `
    -MarkdownContent $reportMd `
    @brandingMailParams
```

With no branding configured, `$brandingMailParams` is an empty hashtable and the call behaves exactly as if the parameter had been omitted.

## Parameters

All parameters are optional — the function is designed to be called with whatever the tenant happens to have configured.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `HeaderImageUrl` | `string` | — | Public HTTPS URL of the header image (`RJReport.Branding.HeaderImageUrl`). |
| `FooterImageUrl` | `string` | — | Public HTTPS URL of the footer image (`RJReport.Branding.FooterImageUrl`). |
| `FooterLink` | `string` | — | Target URL of the footer image (`RJReport.Branding.FooterLink`). Passed through, not validated. |
| `AccentColor` | `string` | — | Accent color (`RJReport.Branding.AccentColor`). Passed through; the hex format is validated by `Send-RjRbReportEmail`. |
| `TextColor` | `string` | — | Text color (`RJReport.Branding.TextColor`). Same handling as `AccentColor`. |
| `TimeoutSec` | `int` | `30` | Download timeout per image. |
| `MaxImageBytes` | `long` | `200KB` | Maximum accepted image size. Branding images share the ~4 MB `sendMail` limit with the report attachments. |

## Outputs

A `[hashtable]` containing only the successfully resolved keys:

| Key | Value |
| --- | --- |
| `HeaderImage` | Local path of the downloaded header image |
| `FooterImage` | Local path of the downloaded footer image |
| `FooterLink` | Trimmed footer link |
| `AccentColor` | Trimmed accent color |
| `TextColor` | Trimmed text color |

Every key maps to a parameter of `Send-RjRbReportEmail`, which is what makes splatting safe.

## Validation

Each image passes through the following checks before it is accepted:

| Check | Rejection reason |
| --- | --- |
| URL scheme | Only `https` is accepted — the image bytes end up inside company mail, so plain HTTP is refused. |
| Download | Non-2xx responses, timeouts and network errors are caught; the response body of a storage error is not silently treated as an image. |
| Size | Empty files and files larger than `MaxImageBytes` (default 200 KB). |
| File signature | The first bytes must identify a PNG, JPEG or GIF. An HTML error page saved under a `.png` name is rejected here. |

The temp file is given the extension matching its **detected** format, because `Send-RjRbReportEmail` derives the attachment content type from it — a URL without a file extension, or with a misleading one, therefore works correctly.

## Behavior Notes

### Hosting the images

The URL only needs to be reachable from the Azure Automation sandbox. Two common patterns:

- **Public blob or CDN** — simplest, but the images are readable by anyone.
- **Private container with a SAS token in the URL** — the container stays private and only holders of the link can read it. Remember that the SAS expiry silently ends branding: after it lapses, reports continue to arrive with the RealmJoin defaults and the reason is only visible as a warning in the job log.

### Temp file cleanup

Downloaded images are written to the sandbox temp directory. The sandbox is discarded after the run, so cleanup is optional — but runbooks with an explicit cleanup region should remove them after the last email:

```powershell
foreach ($brandingKey in @('HeaderImage', 'FooterImage')) {
    if ($brandingMailParams -and $brandingMailParams.ContainsKey($brandingKey) -and (Test-Path -LiteralPath $brandingMailParams[$brandingKey])) {
        Remove-Item -LiteralPath $brandingMailParams[$brandingKey] -Force -ErrorAction SilentlyContinue
    }
}
```

### Diagnosing branding that does not appear

When a report arrives with the default graphics although branding is configured, the job log identifies the stage that failed:

| Log entry | Cause |
| --- | --- |
| No `Branding:` entry at all | The settings never reached the runbook — check the customization JSON and whether the portal knows this runbook version. |
| `Only HTTPS URLs are supported` | The URL uses `http://`. |
| A storage error such as `PublicAccessNotPermitted` | The request arrived unauthenticated — the SAS token is missing from the URL, often because it was truncated when copied. |
| `exceeds the … limit for inline email images` | The file is larger than `MaxImageBytes`. |
| `not a PNG, JPEG or GIF image` | The download returned something other than an image, typically an error page. |

## See Also

- [Send-RjRbReportEmail](send-rjrbreportemail.md) — the consumer of the returned parameters.
- [Runbook Report Settings](../../automation/runbooks/runbook-report-settings.md#email-branding-optional) — configuring the `RJReport.Branding.*` settings as an administrator.
