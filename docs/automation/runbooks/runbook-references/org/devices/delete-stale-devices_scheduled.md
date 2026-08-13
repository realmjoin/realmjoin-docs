---
title: Delete Stale Devices (Scheduled)
description: Scheduled deletion of stale devices based on last activity date and platform
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Identifies Intune managed devices that have not been active for a specified number of days.
By default the runbook runs in report-only mode (simulation) and lists the devices that would be deleted.
When deletion is enabled, the matching devices are deleted from Intune and the results are included in the report.
An email report with CSV and/or Excel (xlsx) attachments can be sent optionally and the report files can also be uploaded to an Azure Storage Account, returning time-limited download links.

## Location
Organization → Devices → Delete Stale Devices (Scheduled)

**Full Runbook name**

rjgit-org_devices_delete-stale-devices_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 2.0.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.3.4) |
| Schedulable | yes |

## Notes
This runbook deletes managed devices from Intune based on inactivity. Use with care!

Prerequisites:
- EmailFrom parameter must be configured in runbook customization (RJReport.EmailSender setting) when email reporting is used

Common Use Cases:
- Regular cleanup of stale device records in Intune
- Simulation runs (report-only mode) before enabling actual deletion
- Scheduled lifecycle management with an audit trail via email report

The runbook supports optional user scope filtering to include or exclude devices based on primary user group membership.
This acts as an additional safety net when deletion is enabled.

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.ReadWrite.All
  - Directory.Read.All
  - Device.Read.All
  - Mail.Send


## Parameters
### Days

Number of days without activity to be considered stale.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |
| Portal display name | Minimum Days Without Activity |

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

Include iOS devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include iOS Devices |

### Android

Include Android devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include Android Devices |

### DeleteDevices

If set to true, the matching stale devices are deleted from Intune.
If false (default), the runbook only reports which devices would be deleted (simulation).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Deletion Mode |

**Portal options**

| Portal option | Value |
| --- | --- |
| Report only - show what would be deleted (simulation) | false |
| Delete stale devices from Intune | true |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization

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
| Default Value | CSV & XLSX |
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
| Default Value | delete-stale-devices |
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

### UseUserScope

Enable user scope filtering to include or exclude devices based on primary user group membership.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Use User Scope Filtering |
| Hidden in portal | yes (preset via runbook customization) |

### IncludeUserGroup

Only include devices whose primary users are members of this group. Requires UseUserScope to be enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Users to include (Group) |
| Hidden in portal | yes (preset via runbook customization) |

### ExcludeUserGroup

Exclude devices whose primary users are members of this group. Requires UseUserScope to be enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Users to exclude (Group) |
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

