---
title: Report EPM Elevation Requests (Scheduled)
description: Generate report for Endpoint Privilege Management (EPM) elevation requests
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Queries Microsoft Intune for EPM elevation requests with flexible filtering options.
Supports filtering by multiple status types and time range.
Sends an email report with summary statistics and detailed report file attachments.
The report files can also be uploaded to an Azure Storage Account, returning time-limited download links.
The ReportFileFormat parameter controls which file formats are generated and delivered (CSV only, CSV & XLSX, or XLSX only).
When the CSV attachment exceeds the email size limit and "CSV & XLSX" is selected, the email falls back to the Excel workbook alone.

## Setup regarding email sending

Sending an email report is optional and only happens when a recipient (`EmailTo`) is provided. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details.


## Location
Organization → Security → Report EPM Elevation Requests (Scheduled)

**Full Runbook name**

rjgit-org_security_report-EPM-elevation-requests_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.3.4) |
| Schedulable | yes |

## Notes
Runbook Type: Scheduled (recommended: monthly)

Purpose & Use Cases:
- Regular reporting of EPM activities
- Audit trail for approved/denied elevation requests
- Analysis of expired requests to identify process bottlenecks
- Identification of frequently requested applications for automatic elevation rules

Status Types Explained:
- Pending: Awaits admin decision (use monitor-pending-EPM-requests for time-critical alerting)
- Approved: Admin approved the request, user can proceed with elevation
- Denied: Admin rejected the request due to security/policy concerns
- Expired: Request expired before admin review (may indicate slow response times)
- Revoked: Previously approved elevation was later revoked by admin
- Completed: User successfully executed the elevated application after approval

Data Retention & Time Ranges:
- Intune retains EPM request details for 30 days after creation
- For long-term analysis, archive CSV exports outside of Intune
- Default filter (Approved/Denied/Expired/Revoked, 30 days)

Email & Export Details:
- Generates CSV and/or Excel (xlsx) report files with complete request details (see ReportFileFormat)
- Emails sent individually to each recipient for privacy
- No email sent when zero requests match the filter criteria
- Report files include: timestamps, users, devices, applications, justifications, file hashes

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementConfiguration.Read.All
  - Mail.Send


## Parameters
### IncludeApproved

Include requests with status "Approved" - Request has been approved by an administrator.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Approved Requests (approved by admin) |

### IncludeDenied

Include requests with status "Denied" - Request was rejected by an administrator.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Denied Requests (rejected by admin) |

### IncludeExpired

Include requests with status "Expired" - Request expired before approval/denial.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Expired Requests (expired before decision) |

### IncludeRevoked

Include requests with status "Revoked" - Previously approved request was revoked.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Revoked Requests (approval revoked) |

### IncludePending

Include requests with status "Pending" - Awaiting approval decision.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Pending Requests (awaiting approval) |

### IncludeCompleted

Include requests with status "Completed" - Request was approved and executed successfully.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Completed Requests (approved and executed) |

### MaxAgeInDays

Filter requests created within the last X days (default: 30).
Note: Request details are retained in Intune for 30 days after creation.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |
| Portal display name | Filter requests created within last X days (retention: 30 days) |

### EmailTo

Can be a single address or multiple comma-separated addresses (string).
The function sends individual emails to each recipient for privacy reasons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Recipient Email Address(es) |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization.

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

**Portal options**

| Portal option | Value |
| --- | --- |
| CSV & XLSX |  |
| CSV only |  |
| XLSX only |  |

### CreateDownloadLink

If enabled, the report files are uploaded to an Azure Storage Account and time-limited download links are returned. Disabled by default.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Create a file download link (upload report to storage)? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes - upload report and return a download link | true |
| No - do not create a download link | false |

### ContainerName

Storage container name used for the upload. Configured per runbook (not a global RJReport setting).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | report-epm-elevation-requests |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group that contains the storage account. Sourced from the RJReport tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account name used for the upload. Sourced from the RJReport tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### LinkExpiryDays

Number of days until the generated download link expires. Sourced from the RJReport tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6 |
| Type | Int32 |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

