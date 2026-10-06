---
title: Report Pim Activations (Scheduled)
description: Report the PIM role activations of the last month by email
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Reads the Entra ID audit log for Privileged Identity Management role activations of the last month and sends them as an email report, so privileged access can be reviewed regularly. Nothing is changed.

## Location
Organization → General → Report Pim Activations (Scheduled)

**Full Runbook name**

rjgit-org_general_report-pim-activations_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - AuditLog.Read.All
    - *Queries /auditLogs/directoryAudits for PIM role activation events of the last month*
  - Mail.Send
    - *Sends the PIM activation report via /users/{sendAlertFrom}/sendMail when activations were found*


## Parameters
### sendAlertTo

Gets the monthly PIM activation report.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja.com |
| Type | String |
| Portal display name | Report recipient |

### sendAlertFrom

User in the tenant the report is sent as; needs a mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbook@glueckkanja.com |
| Type | String |
| Portal display name | Report sender |



[Back to Runbook Reference overview](../../README.md)

