---
title: List Group Ownerships
description: List group ownerships for this user.
---

## Description
Lists Entra ID groups where the specified user is an owner. Outputs the group names and IDs.
The ReportFileFormat parameter controls which file formats are generated and delivered (CSV only, CSV & XLSX, or XLSX only).
When the CSV attachment exceeds the email size limit and "CSV & XLSX" is selected, the email falls back to the Excel workbook alone.

## Location
User → General → List Group Ownerships

**Full Runbook name**

rjgit-user_general_list-group-ownerships

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - Group.Read.All
  - Mail.Send
  - Organization.Read.All


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### SendMail

If enabled, the report is sent via email with the selected report file format(s) attached. Toggling this on reveals the recipient address and report file format fields.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### EmailTo

Recipient address or multiple comma-separated addresses for the email report. Only used when SendMail is enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization.

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

If enabled, the report files (CSV and Excel) are uploaded to an Azure Storage Account and time-limited download links are returned in the output.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ContainerName

Storage container name used for the upload.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | user-group-ownerandmemberships |
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



[Back to Runbook Reference overview](../../README.md)

