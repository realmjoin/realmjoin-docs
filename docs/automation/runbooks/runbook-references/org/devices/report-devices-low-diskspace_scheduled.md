---
title: Report Devices Low Diskspace (Scheduled)
description: Scheduled report of managed devices running low on free disk space.
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Identifies and lists Intune managed devices whose free disk space is below a configurable threshold, either a fixed amount of free space in gigabytes or a percentage of the total disk size.
The result can be narrowed down by platform and by manufacturer and model filters, and each reported device is rated as Critical or Warning depending on how far below the threshold it is.
Automatically sends a report via email with CSV and/or Excel (xlsx) attachments.
The report files can also be uploaded to an Azure Storage Account, returning time-limited download links.
The ReportFileFormat parameter controls which file formats are generated and delivered (CSV only, CSV & XLSX, or XLSX only).
When the CSV attachment exceeds the email size limit and "CSV & XLSX" is selected, the email falls back to the Excel workbook alone.

## Data freshness and limitations

The free and total disk space values are read from the Intune hardware inventory of each managed device. This inventory is refreshed with the regular device check-in, so the report describes the state of the last successful inventory rather than the current state of the device. Use the **Last Sync** column of the report to judge how up to date an individual row is.

Devices that report a total disk size of zero bytes have no usable storage inventory. This is common for Android Enterprise work profiles and also happens on devices that have not completed an inventory yet. Such devices are excluded from the evaluation instead of being reported as "0 GB free", and their number is shown in the console output and in the email summary.

Windows and macOS are included by default, iOS/iPadOS and Android are not. The default threshold of 20 GB is dimensioned for desktop disks and would report a large number of perfectly healthy mobile devices. When you enable the mobile platforms, the percentage based threshold (`ThresholdType` = *Free space below a percentage of the disk size*) usually gives more meaningful results.

## Threshold and severity

`ThresholdType` selects whether a device is reported based on a fixed amount of free space (`FreeSpaceThresholdGB`) or based on the share of free space relative to its disk size (`FreeSpacePercentThreshold`). Only the field belonging to the selected type is shown in the portal.

Every reported device is rated: devices below half of the configured threshold are marked as **Critical**, all other reported devices as **Warning**. In the Excel workbook these ratings are highlighted in red and yellow.

## Report delivery

Report files are only generated when a delivery method is used, that is when a recipient (`EmailTo`) is provided and/or `CreateDownloadLink` is enabled. Without either, the result is read directly in the RealmJoin portal output. Email delivery and download link generation are independent and can be combined.

For the download link, the report files are uploaded to the Azure storage account configured in the `RJReport.StorageAccount.*` tenant settings, and time-limited SAS download links are returned. The storage upload authenticates with the Automation account's managed identity; that identity needs the **Storage Account Contributor** RBAC role on the target storage account (this is an Azure RBAC assignment, not a Graph application permission).

## Setup regarding email sending

Sending an email report is optional and only happens when a recipient (`EmailTo`) is provided. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details on all available settings.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** – public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** – target of the footer image
- **Accent and text color** – 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email – the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).


## Location
Organization → Devices → Report Devices Low Diskspace (Scheduled)

**Full Runbook name**

rjgit-org_devices_report-devices-low-diskspace_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | yes |

## Notes
This runbook complements the reporting foundation and delivers a recurring overview of devices that are about to run out of disk space,
so that affected users can be contacted before the lack of free space starts to block updates, app installations or profile synchronization.

Prerequisites:
- EmailFrom parameter must be configured in runbook customization (RJReport.EmailSender setting)

Data source and freshness:
The free and total disk space values are taken from the Intune hardware inventory of each device, which is refreshed with the regular device check-in.
They therefore describe the state of the last successful inventory and not necessarily the current state, so the Last Sync column of the report should be used to judge how up to date a row is.
Devices that report a total disk size of zero bytes have no usable storage inventory (this is common for Android Enterprise work profiles) and are excluded from the evaluation, but their number is reported.

Platform defaults:
Windows and macOS are included by default, iOS/iPadOS and Android are not, because the default threshold in gigabytes is dimensioned for desktop disks
and would report a large number of perfectly healthy mobile devices. When mobile platforms are enabled, the percentage based threshold usually gives more meaningful results.

Common Use Cases:
- Recurring disk space monitoring across the managed device fleet
- Finding devices that are likely to fail feature updates or app deployments because of insufficient free space
- Preparing targeted user communication or cleanup campaigns
- Checking a specific hardware generation via the manufacturer and model filters

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
    - *Reads Intune managed devices including freeStorageSpaceInBytes and totalStorageSpaceInBytes to find devices below the low disk space threshold*
  - Organization.Read.All *(optional — feature: Email report)*
    - *Reads /organization for the tenant name used in the report file names, the email subject and the email footer; without it the runbook falls back to 'Unknown Tenant'*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the report email via Send-RjReportEmail when EmailTo is configured*

### Permission notes
Azure Storage Account: 'Storage Account Contributor' role for the Automation Account's managed identity on the target storage account - the upload retrieves the account keys via listKeys (only required when CreateDownloadLink is used)


## Parameters
### ThresholdType

Determines how low disk space is detected, either by a fixed amount of free space in gigabytes or by the percentage of free space relative to the disk size.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Free space in GB |
| Type | String |
| Portal display name | How should low disk space be determined? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Free space below a fixed size (GB) |  |
| Free space below a percentage of the disk size (%) |  |

### FreeSpaceThresholdGB

Devices with less free disk space than this value in gigabytes are reported. Only used when the threshold type is set to free space in gigabytes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 20 |
| Type | Int32 |
| Portal display name | Low Disk Space Threshold (free GB) |

### FreeSpacePercentThreshold

Devices with a lower percentage of free disk space than this value are reported. Only used when the threshold type is set to free space in percent.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 10 |
| Type | Int32 |
| Portal display name | Low Disk Space Threshold (free %) |
| Hidden in portal | yes (preset via runbook customization) |

### Windows

Include Windows devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include Windows Devices |

### MacOS

Include macOS devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include macOS Devices |

### iOS

Include iOS and iPadOS devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include iOS/iPadOS Devices |

### Android

Include Android devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Android Devices |

### ManufacturerFilter

Optional comma-separated list of manufacturer names. A device is included when its manufacturer contains one of the entries. Leave empty to include all manufacturers.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Manufacturer Filter (comma-separated, substring match, leave empty for all) |

### ModelFilter

Optional comma-separated list of model names. A device is included when its model contains one of the entries. Leave empty to include all models.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Model Filter (comma-separated, substring match, leave empty for all) |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingHeaderImageUrl

Optional public HTTPS URL of a custom header image (PNG/JPEG/GIF, max. 200 KB) for the report email.
Sourced from the RJReport.Branding.HeaderImageUrl tenant setting. When empty, the default RealmJoin header graphic is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterImageUrl

Optional public HTTPS URL of a custom footer image (PNG/JPEG/GIF, max. 200 KB) for the report email.
Sourced from the RJReport.Branding.FooterImageUrl tenant setting. When empty, the default RealmJoin footer graphic is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterLink

Optional URL the footer image links to. Sourced from the RJReport.Branding.FooterLink tenant setting.
When empty, the default link (https://www.realmjoin.com) is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingAccentColor

Optional accent color override (6-digit hex, e.g. '#0052cc') for the report email template.
Sourced from the RJReport.Branding.AccentColor tenant setting. When empty or invalid, the default RealmJoin accent color is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingTextColor

Optional text color override (6-digit hex) for the report email template.
Sourced from the RJReport.Branding.TextColor tenant setting. When empty or invalid, the default RealmJoin text color is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ReportFileFormat

Controls which report file formats are generated and delivered: "CSV only", "CSV & XLSX" (default) or "XLSX only".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | XLSX only |
| Type | String |
| Portal display name | Report file format |

**Portal options**

| Portal option | Value |
| --- | --- |
| CSV & XLSX |  |
| CSV only |  |
| XLSX only |  |

### CreateDownloadLink

If enabled, the report files are uploaded to an Azure Storage Account and time-limited download links are returned. Disabled by default.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Create a file download link (upload report to storage)? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes - upload report and return a download link | true |
| No - do not create a download link | false |

### ContainerName

Storage container name used for the upload. Configured per runbook (not a global RJReport setting).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | report-devices-low-diskspace |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group that contains the storage account. Sourced from the RJReport tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account name used for the upload. Sourced from the RJReport tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### LinkExpiryDays

Number of days until the generated download link expires. Sourced from the RJReport tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6 |
| Type | Int32 |
| Hidden in portal | yes (preset via runbook customization) |

### EmailTo

If specified, an email with the report will be sent to the provided address(es).
Can be a single address or multiple comma-separated addresses (string).
The function sends individual emails to each recipient for privacy reasons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Recipient Email Address(es) |



[Back to Runbook Reference overview](../../README.md)

