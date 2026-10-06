---
title: Check Aad Sync Status (Scheduled)
description: Check the last Entra Connect sync and alert when it is off
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Checks whether directory synchronization from on-premises Active Directory is enabled in the tenant. If it is not, an alert email is sent.

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

Gets the alert email when directory synchronization is found disabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja.com |
| Type | String |
| Portal display name | Alert recipient |

### sendAlertFrom

User in the tenant the alert is sent as; needs a mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbooks@glueckkanja.com |
| Type | String |
| Portal display name | Alert sender |



[Back to Runbook Reference overview](../../README.md)

