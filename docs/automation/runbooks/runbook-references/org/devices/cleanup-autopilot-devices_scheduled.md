---
title: Cleanup Autopilot Devices (Scheduled)
description: Remove orphaned and never-enrolled Autopilot registrations
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Cleans up Windows Autopilot registrations: devices whose serial number no longer matches any Intune device (orphaned) and, optionally, devices that never enrolled and are older than a given age. By default it only reports what it would delete; deletion has to be switched on explicitly and can include the matching Entra ID device objects. The report can be sent by email or provided as a download link.

## Deletion is irreversible

- Removing an Autopilot device identity permanently deletes it from Windows Autopilot. There is no soft delete or recycle bin for Autopilot records.
- The physical device cannot re-enter Autopilot until its hardware hash is uploaded again.
- Deleting the Entra device object is likewise permanent; only do so for records that are genuinely dead, meaning the device will never enroll again.

## Recommended first run

1. Run with the delete mode *WhatIf (report only)*, which is the default, and review the output or the emailed CSV.
2. Confirm that the identified devices are genuinely orphaned or never enrolled.
3. Switch to a deletion mode only after the candidate list has been reviewed.

## Parameter interactions

- `DeleteMode` defaults to *WhatIf (report only)*; no deletions occur in that mode.
- *Delete Autopilot device* removes only the Autopilot identity. *Delete Autopilot and Entra device* additionally removes the matching Entra device object, which would otherwise be left behind as a stale record once the Autopilot identity is gone. The second mode requires the `Device.ReadWrite.All` permission.
- `CleanupOrphanedDevices` and `CleanupNeverEnrolledDevices` are independent; either or both can be enabled. `NeverEnrolledAgeDays` applies only to the never-enrolled check.
- `GroupTagFilter`, `ManufacturerFilter` and `ModelFilter` are optional; leave a filter empty to evaluate all values for that dimension. When more than one filter is set, they are combined with AND, so a device must match every populated filter to remain in scope. `GroupTagFilter` matches the group tag exactly (case-insensitive); `ManufacturerFilter` and `ModelFilter` match as case-insensitive substrings, so "Dell" matches "Dell Inc." and "Surface" matches "Surface Laptop 3".
- `ExcludeSerialNumbers` is applied after the AND filters as an exclusion: a device whose serial number is in the list (exact, case-insensitive) is removed from scope regardless of the other filters. Leave it empty to exclude nothing.

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
Organization → Devices → Cleanup Autopilot Devices (Scheduled)

**Full Runbook name**

rjgit-org_devices_cleanup-autopilot-devices_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.3.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.ReadWrite.All
    - *Looks up Entra devices by deviceId and deletes them in 'Delete Autopilot and Entra device' mode*
  - DeviceManagementManagedDevices.Read.All
    - *Reads Intune managed Windows devices to find Autopilot serials no longer present in Intune*
  - DeviceManagementServiceConfig.ReadWrite.All
    - *Lists windowsAutopilotDeviceIdentities and deletes stale Autopilot identities*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the cleanup report email via Send-RjReportEmail when EmailTo is configured*
  - Organization.Read.All
    - *Reads /organization to show the tenant display name in the report output and email*


## Parameters
### DeleteMode

WhatIf only reports the candidates. Delete Autopilot device removes the Autopilot registrations. Delete Autopilot and Entra device also removes the matching Entra ID device objects.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | WhatIf (report only) |
| Type | String |
| Portal display name | Deletion mode |

### GroupTagFilter

Only devices with one of these Autopilot group tags, separated by commas and matched exactly. Leave empty for all.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Group tag filter |

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

### ExcludeSerialNumbers

Serial numbers that are never touched, separated by commas. Leave empty to exclude nothing.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Exclude serial numbers |

### CleanupOrphanedDevices

Removes registrations of devices that once contacted Intune but no longer exist there.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Clean up orphaned devices? |

### OrphanedLastContactedDays

A device counts as orphaned only when its last contact with Intune is older than this many days, so recently active devices are safe.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 90 |
| Type | Int32 |
| Portal display name | Orphaned after (days) |

### CleanupNeverEnrolledDevices

Removes registrations of devices that never contacted Intune and are older than "Never-enrolled after (days)".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Clean up never-enrolled devices? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes, remove aged never-enrolled devices | true |
| No | false |

### NeverEnrolledAgeDays

Never-enrolled registrations older than this many days, counted from their creation date, are removed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 90 |
| Type | Int32 |
| Portal display name | Never-enrolled after (days) |
| Hidden in portal | yes (preset via runbook customization) |

### EmailTo

Send the cleanup report to these addresses, separated by commas. Leave empty to send no email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Recipient email address(es) |

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
| Default Value | cleanup-autopilot-devices |
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

