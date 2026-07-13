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

To include Service Desk contact information in notification emails, add the following properties to the `RJReport` section:

```json
{
    "Settings": {
        "RJReport": {
            "EmailSender": "realmjoin-report@contoso.com",
            "ServiceDesk_DisplayName": "IT Service Desk",
            "ServiceDesk_EMail": "servicedesk@domain.com",
            "ServiceDesk_Phone": "+49123456789"
        }
    }
}
```

**Parameters:**

- `ServiceDesk_DisplayName` — Display name of your Service Desk (e.g., "IT Support", "Help Desk")
- `ServiceDesk_EMail` — Service Desk email address (shown as a clickable `mailto:` link)
- `ServiceDesk_Phone` — Service Desk phone number in international format (shown as a clickable `tel:` link)

All three parameters are optional. If configured, they will appear in the email footer as clickable links.

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
                "LinkExpiryDays": 6,
                "AddBlobNamePrefix": true,
                "UseRandomPrefix": false
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
| `AddBlobNamePrefix` | no | `true` | Prepends a timestamp (`yyyyMMdd-HHmmss`) to the blob name to prevent overwrites |
| `UseRandomPrefix` | no | `false` | Uses a 6-character alphanumeric random string as prefix instead of a timestamp; only applies when `AddBlobNamePrefix` is `true` |

> **Note:** Settings that are specific to an individual runbook — such as the target container name or a custom blob name — are configured directly on that runbook and are intentionally not part of this central configuration.

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
            "StorageAccount": {
                "ResourceGroup": "rg-reports",
                "StorageAccountName": "stcontosoreports",
                "LinkExpiryDays": 6,
                "AddBlobNamePrefix": true,
                "UseRandomPrefix": false
            }
        }
    }
}
```
