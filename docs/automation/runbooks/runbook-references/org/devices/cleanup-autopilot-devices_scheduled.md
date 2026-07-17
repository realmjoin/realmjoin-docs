---
title: Cleanup Autopilot Devices (Scheduled)
description: Clean up orphaned and stale Windows Autopilot device registrations
---

## Description
This scheduled runbook performs regular maintenance of Windows Autopilot device registrations by identifying and removing orphaned devices whose serial numbers no longer match any Intune managed device, and optionally removing never-enrolled Autopilot devices that exceed a configurable age threshold. The runbook operates in WhatIf mode by default for safe reporting, and can optionally send an email summary with CSV and/or Excel (xlsx) attachments listing the devices that would be or were deleted.
The report files can also be uploaded to an Azure Storage Account, returning time-limited download links.
The ReportFileFormat parameter controls which file formats are generated and delivered (CSV only, CSV & XLSX, or XLSX only).
When the CSV attachment exceeds the email size limit and "CSV & XLSX" is selected, the email falls back to the Excel workbook alone.

## Setup regarding email sending

Sending an email report is optional and only happens when a recipient (`EmailTo`) is provided. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details.


## Location
Organization → Devices → Cleanup Autopilot Devices (Scheduled)

**Full Runbook name**

rjgit-org_devices_cleanup-autopilot-devices_scheduled

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.ReadWrite.All
  - DeviceManagementManagedDevices.Read.All
  - DeviceManagementServiceConfig.ReadWrite.All
  - Mail.Send
  - Organization.Read.All


## Parameters
### DeleteMode

Controls what the runbook does with the identified cleanup candidates. "WhatIf (report only)" performs no deletion and only reports the candidates (default, safe). "Delete Autopilot device" removes the Autopilot device identities. "Delete Autopilot and Entra device" removes the Autopilot identities and the matching Entra (Azure AD) device objects, which would otherwise remain as stale records.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | WhatIf (report only) |
| Type | String |

### GroupTagFilter

Comma-separated Autopilot group tags to limit the cleanup scope. Matched exactly (case-insensitive). Leave empty to process all Autopilot devices regardless of group tag.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ManufacturerFilter

Comma-separated device manufacturers to limit the cleanup scope. Matched as case-insensitive substrings, so "Dell" matches "Dell Inc.". Combined with the other filters using AND. Leave empty to process all manufacturers.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ModelFilter

Comma-separated device models to limit the cleanup scope. Matched as case-insensitive substrings, so "Surface" matches "Surface Laptop 3". Combined with the other filters using AND. Leave empty to process all models.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ExcludeSerialNumbers

Comma-separated serial numbers to exclude from the cleanup. Matched exactly (case-insensitive). Any device whose serial number is in this list is removed from scope regardless of the other filters. Leave empty to exclude nothing.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CleanupOrphanedDevices

When enabled, removes Autopilot devices that have contacted Intune in the past but whose serial number is no longer found among Intune managed devices (the managed device record was deleted).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### OrphanedLastContactedDays

Age threshold in days for orphaned devices. An Autopilot device is only treated as orphaned when its last contact with Intune was more than this number of days ago and its serial is no longer present in Intune. This prevents removing devices that contacted Intune recently.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 90 |
| Type | Int32 |

### CleanupNeverEnrolledDevices

When enabled, removes never-enrolled Autopilot devices (devices that never contacted Intune).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### NeverEnrolledAgeDays

Age threshold in days for never-enrolled devices. Measured on the Device creation date.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 90 |
| Type | Int32 |

### EmailTo

Optional email recipient address for the cleanup summary report. Leave empty to only write results to the runbook log.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### EmailFrom

The sender email address for the summary report. This is configured via Runbook Customizations.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ReportFileFormat

Controls which report file formats are generated and delivered: "CSV only", "CSV & XLSX" (default) or "XLSX only".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | CSV & XLSX |
| Type | String |

### CreateDownloadLink

If enabled, the report files are uploaded to an Azure Storage Account and time-limited download links are returned. Disabled by default.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ContainerName

Storage container name used for the upload. Configured per runbook (not a global RJReport setting).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cleanup-autopilot-devices |
| Type | String |

### ResourceGroupName

Resource group that contains the storage account. Sourced from the RJReport tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountName

Storage account name used for the upload. Sourced from the RJReport tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### LinkExpiryDays

Number of days until the generated download link expires. Sourced from the RJReport tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6 |
| Type | Int32 |



[Back to Runbook Reference overview](../../README.md)

