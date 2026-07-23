---
title: Report Users With More Than 5-Devices (Scheduled)
description: Report users with more than five registered devices
---

## Description
This runbook queries Entra ID devices and their registered users to identify users with more than five devices.
It outputs a summary table and can optionally send an email with the report attached as CSV files and/or as an Excel workbook (one worksheet for the summary, one for the details).
The detailed export lists each device with its object ID, Entra ID device ID and display name, and indicates whether the device is also present in Intune as a managed device and whether it is compliant (both highlighted green/red in the Excel workbook).
The report files can also be uploaded to an Azure Storage Account, returning time-limited download links.
The ReportFileFormat parameter controls which file formats are generated and delivered (CSV only, CSV & XLSX, or XLSX only).
When the CSV attachments exceed the email size limit and "CSV & XLSX" is selected, the email falls back to the Excel workbook alone.

## Setup regarding email sending

Sending an email report is optional and only happens when a recipient (`EmailTo`) is provided. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details.


## Location
Organization → Devices → Report Users With More Than 5-Devices (Scheduled)

**Full Runbook name**

rjgit-org_devices_report-users-with-more-than-5-devices_scheduled

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
  - Mail.Send


## Parameters
### IntuneOnlyDevices

If enabled, only devices that are present in Intune (managed devices) are considered for the report.
The "InIntune" column is omitted from the detailed CSV export in this case, as all reported devices are Intune-managed.
Disabled by default.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

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
| Default Value | users-with-more-than-5-devices |
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

### EmailFrom

The sender email address. This needs to be configured in the runbook customization.

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

