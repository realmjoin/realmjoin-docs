---
title: List Group Memberships
description: List the group memberships of this user
---

## Description
Lists the groups this user is a member of, with filters for group type, membership type, role assignability, Teams, source and writeback. The result is shown as CSV text. The report can be sent by email or provided as a download link.

## Setup regarding email sending

Sending an email report is optional and only happens when the `SendMail` option is enabled; a recipient (`EmailTo`) is then required. The sender address is taken from the `RJReport.EmailSender` tenant setting.

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

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### GroupType

Security groups only, Microsoft 365 groups only, or all groups.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
| Type | String |

### MembershipType

Assigned memberships, dynamic memberships, or all.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
| Type | String |

### RoleAssignable

Yes limits the list to groups that can be assigned Entra ID roles.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | NotSet |
| Type | String |

### TeamsEnabled

Yes limits the list to groups that back a Microsoft Teams team.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | NotSet |
| Type | String |

### Source

Cloud-only groups, groups synchronized from on-premises Active Directory, or all.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
| Type | String |

### WritebackEnabled

Groups with writeback to on-premises Active Directory, groups without, or all.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
| Type | String |

### SendMail

Send the report to the recipient email address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Send the report by email? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes - send the report via email | true |
| No - do not send an email | false |

### EmailTo

Send the report to these addresses. Separate several with commas; each recipient gets a separate email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Recipient email address(es) |
| Hidden in portal | yes (preset via runbook customization) |

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
| Hidden in portal | yes (preset via runbook customization) |

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
| Default Value | user-group-memberships |
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

