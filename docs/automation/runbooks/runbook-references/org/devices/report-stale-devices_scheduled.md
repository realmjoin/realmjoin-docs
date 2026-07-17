---
title: Report Stale Devices (Scheduled)
description: Scheduled report of stale devices based on last activity date and platform.
---

## Description
Identifies and lists devices that haven't been active for a specified number of days.
Automatically sends a report via email with CSV and/or Excel (xlsx) attachments.
The report files can also be uploaded to an Azure Storage Account, returning time-limited download links.
The ReportFileFormat parameter controls which file formats are generated and delivered (CSV only, CSV & XLSX, or XLSX only).
When the CSV attachment exceeds the email size limit and "CSV & XLSX" is selected, the email falls back to the Excel workbook alone.

## Setup regarding email sending

Sending an email report is optional and only happens when a recipient (`EmailTo`) is provided. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details.


## Location
Organization → Devices → Report Stale Devices (Scheduled)

**Full Runbook name**

rjgit-org_devices_report-stale-devices_scheduled

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
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

### MaxDays

Optional maximum number of days without activity. If set, only devices inactive between Days and MaxDays will be included.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | Int32 |

### Windows

Include Windows devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### MacOS

Include macOS devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### iOS

Include iOS devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### Android

Include Android devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization

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
| Default Value | report-stale-devices |
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

### UseUserScope

Enable user scope filtering to include or exclude devices based on primary user group membership.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeUserGroup

Only include devices whose primary users are members of this group. Requires UseUserScope to be enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ExcludeUserGroup

Exclude devices whose primary users are members of this group. Requires UseUserScope to be enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### EmailTo

If specified, an email with the report will be sent to the provided address(es).
Can be a single address or multiple comma-separated addresses (string).
The function sends individual emails to each recipient for privacy reasons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

