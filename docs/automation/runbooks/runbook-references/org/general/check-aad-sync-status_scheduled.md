---
title: Check Aad Sync Status (Scheduled)
description: Check last Azure AD Connect sync status
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
This runbook checks whether on-premises directory synchronization is enabled and when the last sync happened.
It can send an email alert if synchronization is not enabled.

## Location
Organization → General → Check Aad Sync Status (Scheduled)

**Full Runbook name**

rjgit-org_general_check-aad-sync-status_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Directory.Read.All
    - *Reads /organization to evaluate onPremisesSyncEnabled and the last sync timestamp*
  - Mail.Send
    - *Sends the alert email via /users/{sendAlertFrom}/sendMail when the Entra Connect sync is stale*


## Parameters
### sendAlertTo

Email address to send the report to.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja.com |
| Type | String |

### sendAlertFrom

Sender mailbox used for sending the report.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbooks@glueckkanja.com |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

