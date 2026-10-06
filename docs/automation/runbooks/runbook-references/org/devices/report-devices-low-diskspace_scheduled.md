---
title: Report Devices Low Diskspace (Scheduled)
description: Report devices that are running out of disk space
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Lists Intune devices whose free disk space is below a limit, either a fixed number of gigabytes or a percentage of the disk. Each device is rated Warning or Critical depending on how far below it is. The list can be narrowed by platform, manufacturer and model. The report can be sent by email or provided as a download link.

## Common use cases

- Recurring disk space monitoring across the managed device fleet
- Finding devices that are likely to fail feature updates or app deployments because of insufficient free space
- Preparing targeted user communication or cleanup campaigns, for example with **Notify Users About Low Diskspace**
- Checking a specific hardware generation via the manufacturer and model filters

## Data freshness and limitations

The free and total disk space values are read from the Intune hardware inventory of each managed device. This inventory is refreshed with the regular device check-in, so the report describes the state of the last successful inventory rather than the current state of the device. Use the **Last Sync** column of the report to judge how up to date an individual row is.

Devices that report a total disk size of zero bytes have no usable storage inventory. This is common for Android Enterprise work profiles and also happens on devices that have not completed an inventory yet. Such devices are excluded from the evaluation instead of being reported as "0 GB free", and their number is shown in the console output and in the email summary.

This report deliberately lists devices regardless of how old their inventory is, so that a device which stopped checking in still shows up. Its user-facing counterpart **Notify Users About Low Diskspace** does the opposite: it skips devices whose last Intune sync is older than its `MaxInventoryAgeDays` setting, so that nobody is asked to free up space based on outdated numbers. Both runbooks apply the same threshold and the same Critical/Warning rating, so a device is rated identically in both - but this report can list more devices than the notification runbook writes to. The difference is exactly the devices with a stale inventory, and the notification runbook reports their number in its own output.

Windows and macOS are included by default, iOS/iPadOS and Android are not. The default threshold of 20 GB is dimensioned for desktop disks and would report a large number of perfectly healthy mobile devices. When you enable the mobile platforms, the percentage based threshold (`ThresholdType` = *Free space below a percentage of the disk size*) usually gives more meaningful results.

## Threshold and severity

`ThresholdType` selects whether a device is reported based on a fixed amount of free space (`FreeSpaceThresholdGB`) or based on the share of free space relative to its disk size (`FreeSpacePercentThreshold`). Only the field belonging to the selected type is shown in the portal.

Every reported device is rated: devices below half of the configured threshold are marked as **Critical**, all other reported devices as **Warning**. In the Output Data tab each rating has its own table (*Critical devices*, *Warning devices*, worst devices first); in the Excel workbook the ratings are highlighted in red and yellow.

## Report delivery

Every run writes a **Summary** table and the device tables per rating to the Output Data tab of the RealmJoin portal, where each table can also be exported to Excel. Report files (CSV and/or Excel workbook) are only generated when the **Report delivery** option includes an email or a download link. Email delivery and download link generation are independent and can be combined.

For the download link, the report files are uploaded to the Azure storage account configured in the `RJReport.StorageAccount.*` tenant settings, and time-limited SAS download links are returned. The storage upload authenticates with the Automation account's managed identity; that identity needs the **Storage Account Contributor** RBAC role on the target storage account (this is an Azure RBAC assignment, not a Graph application permission). A failed upload is reported as a warning and does not stop the email delivery.

Schedules that were created before the **Report delivery** option existed keep sending their email: a stored recipient alone still enables the email for them. When such a schedule is opened for editing, the option shows *Output Data only*; select the delivery again before saving, otherwise the schedule stops sending the report.

When no device is below the threshold, no report file is created; a selected email delivery still sends a short confirmation without attachments.

## Setup regarding email sending

Sending an email report is optional and only happens when the **Report delivery** option includes an email; a recipient is then required. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details on all available settings.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** - public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** - target of the footer image
- **Accent and text color** - 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email - the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).


## Location
Organization → Devices → Report Devices Low Diskspace (Scheduled)

**Full Runbook name**

rjgit-org_devices_report-devices-low-diskspace_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
    - *Reads Intune managed devices including freeStorageSpaceInBytes and totalStorageSpaceInBytes to find devices below the low disk space threshold*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the report email via Send-RjRbReportEmail when email delivery is selected*
  - Organization.Read.All *(optional — feature: Email report)*
    - *Reads /organization for the tenant name used in the report file names, the email subject and the email footer; without it the runbook falls back to 'Unknown Tenant'*

### Permission notes
Azure Storage Account: 'Storage Account Contributor' role for the Automation Account's managed identity on the target storage account - the upload retrieves the account keys via listKeys (only required for the download link options)


## Parameters
### ThresholdType

By a fixed amount of free gigabytes or by the percentage of free space on the disk.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Free space in GB |
| Type | String |
| Portal display name | How should low disk space be determined? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Free space below a fixed size (GB) | Free space in GB |
| Free space below a percentage of the disk size (%) | Free space in percent |

### FreeSpaceThresholdGB

Devices with less free space than this many gigabytes are reported.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 20 |
| Type | Int32 |
| Portal display name | Free space limit (GB) |

### FreeSpacePercentThreshold

Devices with less free space than this percentage of the disk are reported.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 10 |
| Type | Int32 |
| Portal display name | Free space limit (%) |
| Hidden in portal | yes (preset via runbook customization) |

### Windows

Includes Windows devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include Windows devices? |

### MacOS

Includes macOS devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include macOS devices? |

### iOS

Includes iOS and iPadOS devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include iOS/iPadOS devices? |

### Android

Includes Android devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Android devices? |

### ManufacturerFilter

Only these manufacturers, separated by commas; Dell also matches Dell Inc. Leave empty for all.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Manufacturer filter |

### ModelFilter

Only these models, separated by commas; Surface also matches Surface Laptop 3. Leave empty for all.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Model filter |

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
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### ContainerName

Storage container the report files are uploaded to. Set per runbook.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | report-devices-low-diskspace |
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

### SendEmailReport

Send the report to the recipient email address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### EmailTo

Send the report to these addresses. Separate several with commas; each recipient gets a separate email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Recipient email address(es) |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

