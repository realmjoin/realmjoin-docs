---
title: Report Users With More Than 5-Devices (Scheduled)
description: Report users with more than five registered devices
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Finds users who have more than five devices registered in Entra ID. The report has a summary and a detailed list of their devices, including whether each device is managed by Intune and compliant. Useful to spot leftover registrations before device limits are hit. The report can be sent by email or provided as a download link.

## Report delivery

Report files are only generated when a delivery method is selected via the **Report delivery** option (email and/or download link). With *Output Data only* selected, the results are read directly in the Output Data tab of the RealmJoin portal, where each table can also be exported to Excel. Email delivery and download link generation are independent and can be combined.

The Output Data tab shows a *Summary* table, the *Users* with more than five devices and their *Devices*. The Excel workbook holds the same two lists on the worksheets *Users* and *Devices*, the CSV export writes them to a summary file and a details file.

For the download link, the report files are uploaded to the Azure storage account configured in the `RJReport.StorageAccount.*` tenant settings, and time-limited SAS download links are returned. The storage upload authenticates with the Automation account's managed identity; that identity needs the **Storage Account Contributor** RBAC role on the target storage account (this is an Azure RBAC assignment, not a Graph application permission).

Schedules that were created before the **Report delivery** option existed keep sending their email: a stored recipient alone still enables the email for them. When such a schedule is opened for editing, the option shows *Output Data only*; select the delivery again before saving, otherwise the schedule stops sending the report.

With email delivery selected, an email is also sent when no user has more than five devices.

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
Organization → Devices → Report Users With More Than 5-Devices (Scheduled)

**Full Runbook name**

rjgit-org_devices_report-users-with-more-than-5-devices_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.12.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
    - *Lists all Entra devices with their registered users to count devices per user*
  - DeviceManagementManagedDevices.Read.All
    - *Reads all Intune devices to mark each device's Intune presence in the report*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the report email via Send-RjRbReportEmail when email delivery is selected*
  - Organization.Read.All *(optional — feature: Email report)*
    - *Reads the tenant display name for the email subject, the email body and the workbook cover sheet*

### Permission notes
Azure Storage Account: 'Storage Account Contributor' role for the Automation Account's managed identity on the target storage account - the upload retrieves the account keys via listKeys (only required for the download link options)


## Parameters
### IntuneOnlyDevices

Counts only devices that are also managed by Intune, so unmanaged registrations are ignored.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Only count devices managed by Intune? |

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
| Default Value | users-with-more-than-5-devices |
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



[Back to Runbook Reference overview](../../README.md)

