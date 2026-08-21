---
title: Report Pim Activations (Scheduled)
description: Scheduled report on PIM activations
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
This runbook queries Microsoft Entra ID audit logs for recent PIM activations.
It builds an report and sends it via email.

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

Recipient email address for the report.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja.com |
| Type | String |

### sendAlertFrom

Sender mailbox UPN used to send the report email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbook@glueckkanja.com |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

