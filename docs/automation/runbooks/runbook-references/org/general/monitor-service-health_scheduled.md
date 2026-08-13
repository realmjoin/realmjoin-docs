---
title: Monitor Service Health (Scheduled)
description: Alert by email on newly announced Microsoft 365 Service Health issues
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

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

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>Microsoft.Graph.Authentication (>= 2.38.0) |
| Schedulable | yes |

## Notes
Common Use Cases:
- Schedule the runbook to run at or slightly more often than LookbackHours to catch every new Service Health issue exactly once.
- Set Services to a comma-separated list of service names or short ids (matched case-insensitively) to monitor only specific services, such as Exchange Online or Teams; leave it empty to monitor all services.
- Leave IncludeAdvisories and IncludeResolvedIssues at their default of $false for the lowest-noise setup, which alerts only on unresolved incidents; set either to $true to also surface advisories or issues Microsoft has already marked resolved.

Parameter Interactions:
- An issue counts as newly announced when its first Service Health post falls inside the LookbackHours window (falling back to startDateTime if the issue has no posts) - not by lastModifiedDateTime alone. This avoids missing back-dated issues while preventing re-alerts on every status update of an ongoing incident.
- The runbook keeps no state between runs, so a failed or skipped run means those alerts are never sent unless LookbackHours is temporarily widened for a catch-up run.
- One email is sent per new issue, so a busy Service Health day can produce several emails per run.

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
| Portal display name | Services to Monitor (comma-separated, leave empty for all) |

### LookbackHours

How many hours back to look for newly announced issues. Set this to the same interval as the runbook schedule, for example 24 for a daily schedule, so that no issue is missed and none is alerted on twice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 24 |
| Type | Int32 |
| Portal display name | Lookback Window (hours 1 - 168) - match to schedule interval |

### IncludeAdvisories

If set to false, only incidents raise an alert. If set to true, advisories are alerted on as well.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Advisories (not just Incidents) |

### IncludeResolvedIssues

If set to false, issues that Microsoft has already marked as resolved by the time the runbook runs are skipped. If set to true, resolved issues are still reported.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Already-Resolved Issues |

### EmailFrom

The sender email address used for the per-issue alert emails. This needs to be configured in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### EmailTo

Comma-separated list of recipient email addresses for the per-issue alert emails. At least one valid recipient is required.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Alert Email Recipient Email Address(es) |



[Back to Runbook Reference overview](../../README.md)

