---
title: List Signin Events
description: Show the recent sign-ins of this user and their failures
---

## Description
Lists the Entra ID sign-ins of this user for the chosen number of days with application, time, result, client app, device and location. Failures are summed up per application so support can see where sign-ins go wrong, and failed sign-ins also show the IP address. The report can be sent by email or provided as a download link.

## Common use cases

- Investigate which application generates sign-in failures for a specific user and why, grouped by error code.
- Narrow the results with `ApplicationName` (partial match) or `FailedSignInsOnly` when a user reports access issues.
- Export the sign-in data to CSV or Excel for further analysis when the event count is too large to read in the portal.

## Behaviour

- Sign-in log data is retrieved from the Microsoft Graph beta endpoint, because sign-in event type filtering and the retrieval of non-interactive sign-ins require beta-only properties (`signInEventTypes`, `authenticationRequirement`).
- The results are written to the **Output Data** tab of the job on every run: a summary, the per-application summary, the failed sign-ins and, unless only failed sign-ins are requested, all sign-ins. The console shows the counts.
- Non-interactive sign-ins vastly outnumber interactive ones; the sign-in tables in the Output Data tab are capped at the 250 most recent entries, but the exported report files always contain the full result set.

## Required license and permissions

Reading sign-in logs through the Microsoft Graph API requires an **Entra ID P1 or P2 license** in the tenant. Tenants without it receive a 403 error from the sign-in log query even when all Graph permissions are granted. With P1/P2, sign-in logs are retained for up to 30 days; the 7-day retention of the free tier applies to the Entra portal, not to this runbook.

If the sign-in log query returns a 403 although `AuditLog.Read.All` is granted and the tenant is licensed, some tenants additionally require `Directory.Read.All` on the Entra reporting API. Granting it is the known workaround; it is not declared by default because it grants read access to every directory object.

## Report delivery

Report files are only generated when a delivery method is selected via the **Report delivery** option (email and/or download link). With *Output Data only* selected, no report files are created and the sign-in analysis is read in the Output Data tab of the job in the RealmJoin portal. Email delivery and download link generation are independent and can be combined.

For the download link, the report files are uploaded to the Azure storage account configured in the `RJReport.StorageAccount.*` tenant settings, and time-limited SAS download links are returned. The storage upload authenticates with the Automation account's managed identity; that identity needs the **Storage Account Contributor** RBAC role on the target storage account (this is an Azure RBAC assignment, not a Graph application permission).

## Setup regarding email sending

Sending an email report is optional and only happens when *Also email the report* or *Also email & download link* is selected as report delivery; a recipient is then required. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details on all available settings.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** – public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** – target of the footer image
- **Accent and text color** – 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email – the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).

## Interpreting the results

Entra counts some sign-in interrupts as errors (for example 50140 "Keep me signed in", 50058 and 50076), so they appear as failures and are included in the per-application failure rate. Check the failure reason before treating a high failure rate as a genuine problem. Error codes are Entra ID sign-in error codes; look them up at [https://login.microsoftonline.com/error](https://login.microsoftonline.com/error).

Sign-in log data typically lags ~15 minutes but can take up to 2 hours for some records - a very recent sign-in may not yet appear. All timestamps are shown in UTC.


## Location
User → Security → List Signin Events

**Full Runbook name**

rjgit-user_security_list-signin-events

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - AuditLog.Read.All
    - *Reads the target user's Entra ID sign-in events from auditLogs/signIns (beta) to build the report*
  - User.Read.All
    - *Resolves the target user to get id, userPrincipalName and displayName*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the sign-in report email with CSV/XLSX attachments via Send-RjRbReportEmail when email delivery is selected*
  - Organization.Read.All *(optional — feature: Email report)*
    - *Reads /organization to put the tenant name into the report email footer*

### Permission notes
Azure Storage Account: 'Storage Account Contributor' role for the Automation Account's managed identity on the target storage account - the upload retrieves the account keys via listKeys (only required for the download link options)


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Days

How many days of sign-in logs to include, 1 to 30.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 7 |
| Type | Int32 |
| Portal display name | Days to look back |

### SignInType

Interactive sign-ins by the user, non-interactive ones by apps and tokens, or both.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Interactive only |
| Type | String |
| Portal display name | Sign-in type |

### FailedSignInsOnly

Hides successful sign-ins so the failures and their reasons stand out.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Failed sign-ins only? |

### ApplicationName

Shows only sign-ins to applications whose name contains this text. Leave empty for all applications.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Application filter |

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

### SendEmailReport

Whether the report is sent by email. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### EmailTo

Send the report to these addresses. Separate several with commas; each recipient gets a separate email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Recipient email address(es) |
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
| Hidden in portal | yes (preset via runbook customization) |

### ContainerName

Storage container the report files are uploaded to. Set per runbook.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | user-signin-events |
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

