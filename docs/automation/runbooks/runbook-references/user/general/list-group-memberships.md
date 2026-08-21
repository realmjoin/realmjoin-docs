---
title: List Group Memberships
description: List group memberships for this user
---

## Description
Lists group memberships for this user and supports filtering by group type, membership type, role-assignable status, Teams enablement, source, and writeback status. Outputs the results as CSV-formatted text.

## Setup regarding email sending

Sending an email report is optional and only happens when the `SendMail` option is enabled; a recipient (`EmailTo`) is then required. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings: a custom header image, a custom footer image (public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each), a custom footer link, and custom accent and text colors (6-digit hex values, e.g. `#0052cc`). When these settings are not configured, the default RealmJoin graphics and colors are used. A branding image that cannot be downloaded or validated, or a color value that is not a valid hex color, never prevents the report email - the corresponding default is used instead.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for setup details.


## Location
User → General → List Group Memberships

**Full Runbook name**

rjgit-user_general_list-group-memberships

## Details

| Property | Value |
| --- | --- |
| Version | 1.7.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
    - *Resolves the target user to obtain id and UPN for the report*
  - Group.Read.All
    - *Reads the user's groups via /users/{id}/memberOf including membership rules for filtering*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the report email via Send-RjReportEmail when SendMail is enabled and EmailTo is configured*
  - Organization.Read.All
    - *Reads /organization for the tenant display name in the email report*


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

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
| Portal display name | Send the report via email? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes - send the report via email |  |
| No - do not send an email |  |

### EmailTo

Recipient address or multiple comma-separated addresses for the email report. Only used when SendMail is enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Recipient Email Address(es) |
| Hidden in portal | yes (preset via runbook customization) |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization.

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
| Default Value | CSV & XLSX |
| Type | String |
| Portal display name | Report file format |
| Hidden in portal | yes (preset via runbook customization) |

**Portal options**

| Portal option | Value |
| --- | --- |
| CSV & XLSX |  |
| CSV only |  |
| XLSX only |  |

### CreateDownloadLink

If enabled, the report files (CSV and Excel) are uploaded to an Azure Storage Account and time-limited download links are returned in the output.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Create a file download link (upload report to storage)? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes - upload report and return a download link |  |
| No - do not create a download link |  |

### ContainerName

Storage container name used for the upload.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | user-group-memberships |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group that contains the storage account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account name used for the upload.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### LinkExpiryDays

Number of days until the generated download link expires.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6 |
| Type | Int32 |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

