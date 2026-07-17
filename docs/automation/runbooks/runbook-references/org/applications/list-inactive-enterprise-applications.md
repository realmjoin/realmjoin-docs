---
title: List Inactive Enterprise Applications
description: List enterprise applications with no recent sign-ins
---

## Description
This runbook identifies enterprise applications with no recent sign-in activity based on Microsoft Entra ID sign-in logs.
It lists apps that have not been used for the specified number of days and apps that have no sign-in records.
Use it to find candidates for review, cleanup, or decommissioning.

Optionally, the report can be sent via email with CSV and/or Excel (xlsx) attachments containing the inactive and never-used applications.
The report files can also be uploaded to an Azure Storage Account, returning time-limited download links.
The ReportFileFormat parameter controls which file formats are generated and delivered (CSV only, CSV & XLSX, or XLSX only).
When the CSV attachments exceed the email size limit and "CSV & XLSX" is selected, the email falls back to the Excel workbook alone.

## Location
Organization → Applications → List Inactive Enterprise Applications

**Full Runbook name**

rjgit-org_applications_list-inactive-enterprise-applications

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Directory.Read.All
  - Device.Read.All


## Parameters
### Days

Number of days without user logon to consider an application as inactive. Default is 90 days.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 90 |
| Type | Int32 |

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
| Default Value | list-inactive-enterprise-applications |
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

