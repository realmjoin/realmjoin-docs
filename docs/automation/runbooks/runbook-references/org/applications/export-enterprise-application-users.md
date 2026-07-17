---
title: Export Enterprise Application Users
description: Export a report of all (enterprise) application owners and users
---

## Description
This runbook exports a report of enterprise applications (or all service principals) including owners and assigned users or groups.
By default, the generated report files are uploaded to an Azure Storage Account and time-limited download links are returned.
Optionally, the report can be sent via email with CSV and/or Excel (xlsx) attachments.
The ReportFileFormat parameter controls which file formats are generated and delivered (CSV only, CSV & XLSX, or XLSX only).
When the CSV attachment exceeds the email size limit and "CSV & XLSX" is selected, the email falls back to the Excel workbook alone.

## Location
Organization → Applications → Export Enterprise Application Users

**Full Runbook name**

rjgit-org_applications_export-enterprise-application-users

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Directory.Read.All
  - Application.Read.All

### Permission notes
Azure IaaS: - Contributor - access on subscription or resource group used for the export


## Parameters
### entAppsOnly

Determines whether to export only enterprise applications (final value: true) or all service principals/applications (final value: false).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ReportFileFormat

Controls which report file formats are generated and delivered: "CSV only", "CSV & XLSX" (default) or "XLSX only".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | CSV & XLSX |
| Type | String |

### CreateDownloadLink

If enabled, the report files are uploaded to an Azure Storage Account and time-limited download links are returned. Enabled by default.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ContainerName

Storage container name used for the upload.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ResourceGroupName

Resource group that contains the storage account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountName

Storage account name used for the upload.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### LinkExpiryDays

Number of days until the generated download link expires.

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

