---
type: Automation Guide
description: Configure centralized email and storage delivery settings for reporting runbooks.
---

# Runbook Report Settings

## Overview

Several RealmJoin runbooks include automated reporting capabilities to deliver reports, notifications, and alerts directly to administrators. Depending on configuration, reports can be:

- **sent via email** — using the Microsoft Graph API on behalf of a configured sender address
- **uploaded to an Azure Storage Account** — and made available as a time-limited SAS download link

Supporting both delivery channels is the intended standard for all reporting runbooks going forward. Not all reporting runbooks may support both channels yet, but the set of supported runbooks is continuously growing. Both channels can be enabled independently or in combination.

All shared settings are configured once in the [RealmJoin Runbook Customization](https://portal.realmjoin.com/settings/runbooks-customizations) and automatically apply to all runbooks that use the respective feature. Settings that differ per runbook (such as the target container name) are not part of this central configuration and are set directly in the respective runbook.

The functions that consume these settings — [`Send-RjRbReportEmail`](../../dev-reference/report-functions/send-rjrbreportemail.md) and [`Publish-RjRbFilesToStorageContainer`](../../dev-reference/report-functions/publish-rjrbfilestostoragecontainer.md) — are provided by the **RealmJoin.RunbookHelper** PowerShell module. See [Report Functions](../../dev-reference/report-functions/) for detailed usage documentation.

## Email Delivery

### Prerequisites

We recommend using a dedicated shared mailbox, such as `realmjoin-report@contoso.com`. This mailbox will be used as the sender address for all reports. You can use a no-reply address, as recipients are not expected to respond to automated reports.

### Configuration

As described in detail in the [JSON Based Customizing](https://docs.realmjoin.com/automation/runbooks/runbook-customization#json-based-customizing) documentation, navigate to [RealmJoin Runbook Customization](https://portal.realmjoin.com/settings/runbooks-customizations) in the RealmJoin Portal (Settings > Runbook Customizations).

In the `Settings` block, add or modify the `RJReport` section to include the `EmailSender` property with your desired sender email address:

```json
{
    "Settings": {
        "RJReport": {
            "EmailSender": "realmjoin-report@contoso.com"
        }
    }
}
```

Replace `realmjoin-report@contoso.com` with your actual shared mailbox address.

### Service Desk Contact Information (optional)

This central configuration only provides the unified Service Desk values for all runbooks. Whether the contact information is actually included in a notification email is determined by the respective runbook itself — only runbooks that implement the corresponding Service Desk parameters (e.g. `ServiceDeskDisplayName`, `ServiceDeskPortalUrl`) read these values and render them in their emails.

To provide the Service Desk contact information for these runbooks, add the following properties to the `RJReport` section:

```json
{
    "Settings": {
        "RJReport": {
            "EmailSender": "realmjoin-report@contoso.com",
            "ServiceDesk_DisplayName": "IT Service Desk",
            "ServiceDesk_EMail": "servicedesk@domain.com",
            "ServiceDesk_Phone": "+49123456789",
            "ServiceDesk_PortalUrl": "https://servicedesk.domain.com"
        }
    }
}
```

**Parameters:**

- `ServiceDesk_DisplayName` — Display name of your Service Desk (e.g., "IT Support", "Help Desk")
- `ServiceDesk_EMail` — Service Desk email address (shown as a clickable `mailto:` link)
- `ServiceDesk_Phone` — Service Desk phone number in international format (shown as a clickable `tel:` link)
- `ServiceDesk_PortalUrl` — URL of your Service Desk portal or website (shown as a clickable link)

All parameters are optional. If configured, they will appear in the email footer as clickable links.

> **Note:** Some runbooks additionally accept a per-run ticket link (e.g. `ServiceDeskTicketUrl`) to reference the specific ticket that triggered the request. This is a runbook parameter, not part of this central configuration.

### Email Branding (optional)

Report emails can carry tenant-specific branding: the default RealmJoin header and footer graphics can be replaced with your own images, and the footer image can link to a custom target — for example your intranet or IT portal.

To configure branding, add a `Branding` sub-section to the `RJReport` block (nested like `StorageAccount`):

```json
{
    "Settings": {
        "RJReport": {
            "Branding": {
                "HeaderImageUrl": "https://cdn.contoso.com/branding/email-header.png",
                "FooterImageUrl": "https://cdn.contoso.com/branding/email-footer.png",
                "FooterLink": "https://intranet.contoso.com"
            }
        }
    }
}
```

**Parameters:**

| Setting | Required | Default | Description |
| --- | --- | --- | --- |
| `HeaderImageUrl` | no | RealmJoin header graphic | Public HTTPS URL of a custom header image that replaces the default RealmJoin header graphic |
| `FooterImageUrl` | no | RealmJoin footer graphic | Public HTTPS URL of a custom footer image that replaces the default RealmJoin footer graphic |
| `FooterLink` | no | `https://www.realmjoin.com` | URL the footer image links to |

**Image requirements:**

- The image must be reachable via a **public HTTPS URL** — for example an Azure Blob Storage container with anonymous read access, a CDN, or the company website.
- Supported formats: **PNG, JPEG or GIF**.
- Images are rendered at **750 px width**. Recommended dimensions are **750×200 px** (matching the default banners) or **1500×400 px** for high-DPI displays.
- Maximum **200 KB** per image; **100 KB or less** is recommended. The branding images share the ~4 MB total email size limit with the report attachments (for comparison, the default RealmJoin graphics are 52 KB and 15 KB).

The images are downloaded and validated by the runbook on each run. If a setting is left empty, the default RealmJoin graphic (and the default footer link) is used. If a download or validation fails, a warning is logged and the default graphic is used instead — a broken branding configuration never prevents a report email from being sent.

All settings are optional and take effect for all runbooks that send report emails.

## Storage Account Delivery

Reporting runbooks that support this delivery channel can upload their output to an Azure Blob Storage container. After a successful upload, the runbook returns a time-limited SAS link that can be used to download the file directly. This channel can be used independently of or in addition to email delivery.

### Prerequisites

An existing Azure Storage Account is required. The Automation Account's managed identity (or the service principal used by the runbooks) needs at least **Storage Blob Data Contributor** permissions on the Storage Account or its resource group.

### Configuration

Navigate to [RealmJoin Runbook Customization](https://portal.realmjoin.com/settings/runbooks-customizations) and add a `StorageAccount` sub-section to the `RJReport` block:

```json
{
    "Settings": {
        "RJReport": {
            "StorageAccount": {
                "ResourceGroup": "rg-reports",
                "StorageAccountName": "stcontosoreports",
                "LinkExpiryDays": 6
            }
        }
    }
}
```

**Parameters:**

| Setting | Required | Default | Description |
| --- | --- | --- | --- |
| `ResourceGroup` | yes | — | Resource group that contains the Storage Account |
| `StorageAccountName` | yes | — | Name of the Azure Storage Account |
| `LinkExpiryDays` | no | `6` | Number of days until the generated SAS download link expires |

> **Note:** Settings that are specific to an individual runbook — such as the target container name or a custom blob name — are configured directly on that runbook and are intentionally not part of this central configuration. The same applies to blob-name prefixing: whether a timestamp prefix (`yyyyMMdd-HHmmss`) is prepended to the blob name to prevent overwrites is controlled by the `AddBlobNamePrefix` parameter of [`Publish-RjRbFilesToStorageContainer`](../../dev-reference/report-functions/publish-rjrbfilestostoragecontainer.md) (default `$false`), which each runbook passes explicitly.

## Combined Example

The following snippet shows a complete `RJReport` configuration with all features enabled:

```json
{
    "Settings": {
        "RJReport": {
            "EmailSender": "realmjoin-report@contoso.com",
            "ServiceDesk_DisplayName": "IT Service Desk",
            "ServiceDesk_EMail": "servicedesk@domain.com",
            "ServiceDesk_Phone": "+49123456789",
            "ServiceDesk_PortalUrl": "https://servicedesk.domain.com",
            "Branding": {
                "HeaderImageUrl": "https://cdn.contoso.com/branding/email-header.png",
                "FooterImageUrl": "https://cdn.contoso.com/branding/email-footer.png",
                "FooterLink": "https://intranet.contoso.com"
            },
            "StorageAccount": {
                "ResourceGroup": "rg-reports",
                "StorageAccountName": "stcontosoreports",
                "LinkExpiryDays": 6
            }
        }
    }
}
```
