---
title: List Inactive Enterprise Applications
description: List enterprise applications with no recent sign-ins
---

## Description
Finds enterprise applications that nobody has signed in to for a given number of days, plus those that were never used, so you can decide whether they are still needed. The check uses the service principal sign-in activity report, which keeps the last sign-in date of every application. Nothing is changed. Needs a Microsoft Entra ID P1 or P2 license. The report can be sent by email or provided as a download link.

## How the sign-in data is determined

The runbook evaluates the Microsoft Entra **service principal sign-in activity** report
(`/beta/reports/servicePrincipalSignInActivities`). The report holds the date of the last sign-in per
service principal - across delegated and app-only flows, both as client and as resource - and is therefore
not limited to the retention period of the sign-in logs, which keep individual sign-in events for only
7 days (Microsoft Entra ID Free) or 30 days (Microsoft Entra ID P1/P2). A threshold of 90 days can
therefore be evaluated as reliably as one of 7 days.

Every enterprise application (service principal) of the tenant is assigned to exactly one of two lists:

- **Inactive applications** - the last sign-in is older than the configured number of days
- **Applications without any sign-in record** - the report contains no sign-in for the application

The report is part of *Usage & insights* in Microsoft Entra ID and needs a **Microsoft Entra ID P1 or P2** license; without it the runbook stops with an error.

The runbook only reads data. It does not modify the listed applications.

## Report delivery

Report files are only generated when a delivery method is selected via the **Report delivery** option (email and/or download link). With *Output Data only* selected, the results are read directly in the Output Data tab of the RealmJoin portal: a summary table plus one table per list (*Inactive applications*, *No sign-in recorded*), each of which can also be exported to Excel. Email delivery and download link generation are independent and can be combined.

For the download link, the report files are uploaded to the Azure storage account configured in the `RJReport.StorageAccount.*` tenant settings, and time-limited SAS download links are returned. The storage upload authenticates with the Automation account's managed identity; that identity needs the **Storage Account Contributor** RBAC role on the target storage account (this is an Azure RBAC assignment, not a Graph application permission).

When no application is inactive and every application has a recorded sign-in, no file is created. If email delivery is selected, the email is still sent, without attachments, and states that no inactive applications were found.

Schedules that were created before the **Report delivery** option existed keep sending their email: a stored recipient alone still enables the email for them. When such a schedule is opened for editing, the option shows *Output Data only*; select the delivery again before saving, otherwise the schedule stops sending the report.

## Setup regarding email sending

Sending an email report is optional and only happens when *Also email the report* or *Also email & download link* is selected as **Report delivery**; a recipient is then required. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details on all available settings.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** - public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** - target of the footer image
- **Accent and text color** - 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email - the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).


## Location
Organization → Applications → List Inactive Enterprise Applications

**Full Runbook name**

rjgit-org_applications_list-inactive-enterprise-applications

## Details

| Property | Value |
| --- | --- |
| Version | 1.5.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - AuditLog.Read.All
    - *Reads the service principal sign-in activity report for the last sign-in date of each application*
  - Directory.Read.All
    - *Lists the service principals of all enterprise applications*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the report email via Send-RjRbReportEmail when email delivery is selected*
  - Organization.Read.All *(optional — feature: Email report)*
    - *Reads the tenant display name for the report email*

### Permission notes
Azure Storage Account: 'Storage Account Contributor' role for the Automation Account's managed identity on the target storage account - the upload retrieves the account keys via listKeys (only required for the download link options)


## Parameters
### Days

Applications with no sign-in for at least this many days are listed as inactive.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 90 |
| Type | Int32 |
| Portal display name | Days without sign-in |

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
| Hidden in portal | yes (preset via runbook customization) |

### ContainerName

Storage container the report files are uploaded to. Set per runbook.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | list-inactive-enterprise-applications |
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

### SendEmailReport

Send the report to the recipient email address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Send the report by email? |
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



[Back to Runbook Reference overview](../../README.md)

