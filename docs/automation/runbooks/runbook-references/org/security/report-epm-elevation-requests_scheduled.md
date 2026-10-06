---
title: Report EPM Elevation Requests (Scheduled)
description: Report EPM elevation requests by status and age
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Collects the Endpoint Privilege Management elevation requests from Intune, filtered by status and by how long ago they were created. The requests are listed per status with a summary of the counts. Intune keeps request details for 30 days, so older requests cannot be reported. The report can be sent by email or provided as a download link.

## Purpose and use cases

- Regular reporting of Endpoint Privilege Management (EPM) activities
- Audit trail for approved and denied elevation requests
- Analysis of expired requests to identify process bottlenecks
- Identification of frequently requested applications for automatic elevation rules

A monthly schedule is recommended.

## Status types

- **Pending:** awaits an admin decision (use **Monitor Pending EPM Requests** for time-critical alerting)
- **Approved:** an admin approved the request, the user can proceed with the elevation
- **Denied:** an admin rejected the request due to security or policy concerns
- **Expired:** the request expired before an admin reviewed it, which may indicate slow response times
- **Revoked:** a previously approved elevation was later revoked by an admin
- **Completed:** the user successfully executed the elevated application after approval

## Data retention and time ranges

- Intune retains EPM request details for 30 days after creation.
- For long-term analysis, archive the CSV exports outside of Intune.
- The default filter covers the states Approved, Denied, Expired and Revoked over the last 30 days.

## Output and report files

- The Output Data tab of the run shows a *Summary* table with the counts and one table per selected status (for example *Approved requests*), oldest request first.
- The report files hold every matching request with all details: timestamps, users, devices, applications, justifications and file hashes. They are generated as CSV and/or Excel (xlsx), depending on the selected report file format.
- Emails are sent individually to each recipient for privacy.
- No email is sent and no file is created when no request matches the filter criteria. Such a run completes normally; the Output Data tab still shows the summary.

## Report delivery

Report files are only generated when a delivery method is selected via the **Report delivery** option (email and/or download link). With *Output Data only* selected, the results are read directly in the Output Data tab of the RealmJoin portal, where each table can also be exported to Excel. Email delivery and download link generation are independent and can be combined.

For the download link, the report files are uploaded to the Azure storage account configured in the `RJReport.StorageAccount.*` tenant settings, and time-limited SAS download links are returned. The storage upload authenticates with the Automation account's managed identity; that identity needs the **Storage Account Contributor** RBAC role on the target storage account (this is an Azure RBAC assignment, not a Graph application permission).

Schedules that were created before the **Report delivery** option existed keep sending their email: a stored recipient alone still enables the email for them. When such a schedule is opened for editing, the option shows *Output Data only*; select the delivery again before saving, otherwise the schedule stops sending the report.

## Setup regarding email sending

Sending an email report is optional and only happens when *Also email the report* or *Also email & download link* is selected as report delivery; a recipient is then required. The sender address is taken from the `RJReport.EmailSender` tenant setting.

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
Organization → Security → Report EPM Elevation Requests (Scheduled)

**Full Runbook name**

rjgit-org_security_report-EPM-elevation-requests_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.4.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementConfiguration.Read.All
    - *Queries Endpoint Privilege Management elevationRequests by status and creation date to build the report*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the report email with CSV/XLSX attachments via Send-RjRbReportEmail when email delivery is selected*
  - Organization.Read.All *(optional — feature: Email report)*
    - *Reads the tenant display name and ID for the email subject, the email body and the report file names*

### Permission notes
Azure Storage Account: 'Storage Account Contributor' role for the Automation Account's managed identity on the target storage account - the upload retrieves the account keys via listKeys (only required for the download link options)


## Parameters
### IncludeApproved

Includes requests an administrator approved.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include approved requests? |

### IncludeDenied

Includes requests an administrator rejected.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include denied requests? |

### IncludeExpired

Includes requests that expired before a decision was made.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include expired requests? |

### IncludeRevoked

Includes requests whose approval was withdrawn later.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include revoked requests? |

### IncludePending

Includes requests that are still waiting for a decision.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include pending requests? |

### IncludeCompleted

Includes requests that were approved and used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include completed requests? |

### MaxAgeInDays

Only requests created within this many days are reported. Intune keeps request details for 30 days, so a larger value is reduced to 30.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |
| Portal display name | Created within (days) |

### SendEmailReport

Send the report to the recipient email address.

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
| Hidden in portal | yes (preset via runbook customization) |

### ContainerName

Storage container the report files are uploaded to. Set per runbook.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | report-epm-elevation-requests |
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

