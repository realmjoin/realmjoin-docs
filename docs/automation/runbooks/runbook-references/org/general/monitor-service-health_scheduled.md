---
title: Monitor Service Health (Scheduled)
description: Alert by email on newly announced Microsoft 365 Service Health issues
---

## Description
Queries the Microsoft 365 Service Health issues feed on a schedule and identifies issues whose first Service Health post falls within a configurable lookback window, since Microsoft frequently back-dates the official start time and filtering on that alone would miss alerts. Optionally narrows monitoring to a chosen set of services and sends one alert email per newly detected issue, with the subject naming the tenant and the issue title. All issue details are carried in the email body; the runbook produces no report files.

## Setup regarding email sending

Sending an email report is optional and only happens when a recipient (`EmailTo`) is provided. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details.


## Location
Organization → General → Monitor Service Health (Scheduled)

**Full Runbook name**

rjgit-org_general_monitor-service-health_scheduled

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Mail.Send
  - Organization.Read.All
  - ServiceHealth.Read.All


## Parameters
### Services

Comma-separated list of Microsoft 365 service names to monitor, for example Microsoft Intune, Microsoft Entra, Exchange Online. Leave empty to monitor all services. Matching is case-insensitive against both the service display name and its short id, so Intune matches Microsoft Intune. Valid names can be found on the Microsoft 365 admin center service health page.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### LookbackHours

How many hours back to look for newly announced issues. Set this to the same interval as the runbook schedule, for example 24 for a daily schedule, so that no issue is missed and none is alerted on twice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 24 |
| Type | Int32 |

### IncludeAdvisories

If set to false, only incidents raise an alert. If set to true, advisories are alerted on as well.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeResolvedIssues

If set to false, issues that Microsoft has already marked as resolved by the time the runbook runs are skipped. If set to true, resolved issues are still reported.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### EmailFrom

The sender email address used for the per-issue alert emails. This needs to be configured in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### EmailTo

Comma-separated list of recipient email addresses for the per-issue alert emails. At least one valid recipient is required.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

