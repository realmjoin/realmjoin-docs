---
title: List Group Memberships
description: List group memberships for this user
---

## Description
Lists group memberships for this user and supports filtering by group type, membership type, role-assignable status, Teams enablement, source, and writeback status. Outputs the results as CSV-formatted text.

## Location
User → General → List Group Memberships

**Full Runbook name**

rjgit-user_general_list-group-memberships

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

### GroupType

Filter by group type: Security (security permissions only), M365 (Microsoft 365 groups with mailbox), or All (default).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
| Type | String |

### MembershipType

Filter by membership type: Assigned (manually added members), Dynamic (rule-based membership), or All (default).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
| Type | String |

### RoleAssignable

Filter groups that can be assigned to Azure AD roles: Yes (role-assignable only) or NotSet (all groups, default).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | NotSet |
| Type | String |

### TeamsEnabled

Filter groups with Microsoft Teams functionality: Yes (Teams-enabled only) or NotSet (all groups, default).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | NotSet |
| Type | String |

### Source

Filter by group origin: Cloud (Azure AD only), OnPrem (synchronized from on-premises AD), or All (default).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
| Type | String |

### WritebackEnabled

Filter groups by writeback enablement.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
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
| Default Value | user-group-memberships |
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

