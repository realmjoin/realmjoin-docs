---
title: Report Windows Devices Without Autopilot (Scheduled)
description: Report Windows devices in Entra ID without an Autopilot record
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Lists Windows device objects in Entra ID that no Windows Autopilot registration refers to. Such orphaned objects are usually left over from devices that were reset, re-imaged or replaced without cleanup, so the list shows what can be reviewed and deleted. Nothing is changed. The report can be sent by email or provided as a download link.

## Reporting orphaned Windows devices

This runbook lists every Windows device object in Entra ID and matches it against the Windows Autopilot device identities in Intune. Devices that have no associated Autopilot object (matched via the Autopilot object's `azureActiveDirectoryDeviceId`) are reported as clean-up candidates.

Two Yes/No toggles control the output:

- **Send the report via email?** — when enabled, the recipient address field (`EmailTo`) is shown and the report is sent via email with the CSV attached.
- **Create a file download link?** — when enabled, the CSV is uploaded to an Azure Storage Account and a time-limited download link is returned.

Both can be combined or used independently. If both are disabled, the report is only printed to the runbook output.

## Setup regarding the storage account

The CSV report is uploaded to an Azure Storage Account. The target storage account is taken from the shared **RJReport** tenant settings, so it can be configured once and reused across all report runbooks:

- `RJReport.StorageAccount.ResourceGroup`
- `RJReport.StorageAccount.StorageAccountName`
- `RJReport.StorageAccount.LinkExpiryDays` (optional, defaults to 6)

The container name is configured per runbook (parameter `ContainerName`, default `windows-devices-without-autopilot`) and is intentionally not part of the global RJReport settings.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details on all available settings.

The runbook's managed identity needs at least `Contributor` access on the subscription or resource group containing the storage account.

## Setup regarding email sending

Sending an email report is optional and only happens when a recipient (`EmailTo`) is provided. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** – public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** – target of the footer image
- **Accent and text color** – 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email – the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).


## Location
Organization → Devices → Report Windows Devices Without Autopilot (Scheduled)

**Full Runbook name**

rjgit-org_devices_report-windows-devices-without-autopilot_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.3.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
    - *Lists Entra devices filtered to Windows to enumerate all registered Windows devices*
  - DeviceManagementServiceConfig.Read.All
    - *Lists windowsAutopilotDeviceIdentities to detect devices lacking an Autopilot registration*
  - Organization.Read.All
    - *Reads /organization for the tenant name in the report*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the report via Send-RjReportEmail when email reporting is enabled*

### Permission notes
Azure IaaS: - Contributor - access on subscription or resource group used for the export


## Parameters
### SendMail

Send the report to the recipient email address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Send the report by email? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes - send the report via email | true |
| No - do not send an email | false |

### EmailTo

Send the report to these addresses. Separate several with commas; each recipient gets a separate email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Recipient email address(es) |
| Hidden in portal | yes (preset via runbook customization) |

### EmailFrom

Sender address of the report email. Taken from the tenant setting RJReport.EmailSender.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingHeaderImageUrl

Header image of the report email (HTTPS URL, PNG/JPEG/GIF, max 200 KB). Taken from the tenant setting RJReport.Branding.HeaderImageUrl; the default RealmJoin header is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterImageUrl

Footer image of the report email (HTTPS URL, PNG/JPEG/GIF, max 200 KB). Taken from the tenant setting RJReport.Branding.FooterImageUrl; the default RealmJoin footer is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterLink

Link behind the footer image of the report email. Taken from the tenant setting RJReport.Branding.FooterLink; realmjoin.com is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingAccentColor

Accent color of the report email as a 6-digit hex value. Taken from the tenant setting RJReport.Branding.AccentColor; the RealmJoin default is used when empty or invalid.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingTextColor

Text color of the report email as a 6-digit hex value. Taken from the tenant setting RJReport.Branding.TextColor; the RealmJoin default is used when empty or invalid.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ReportFileFormat

Deliver the report as CSV, as an Excel workbook, or both.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | CSV & XLSX |
| Type | String |
| Portal display name | Report file format |
| Hidden in portal | yes (preset via runbook customization) |

**Portal options**

| Portal option | Value |
| --- | --- |
| CSV & XLSX | CSV & XLSX |
| CSV only | CSV only |
| XLSX only | XLSX only |

### CreateDownloadLink

Also upload the report and return a download link that expires after a few days.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Create a download link? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes - upload report and return a download link | true |
| No - do not create a download link | false |

### ContainerName

Storage container the report files are uploaded to. Set per runbook.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | windows-devices-without-autopilot |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group of the storage account for report uploads. Taken from the tenant setting RJReport.StorageAccount.ResourceGroup.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account for report uploads. Taken from the tenant setting RJReport.StorageAccount.StorageAccountName.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### LinkExpiryDays

Number of days a download link stays valid. Taken from the tenant setting RJReport.StorageAccount.LinkExpiryDays.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6 |
| Type | Int32 |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

