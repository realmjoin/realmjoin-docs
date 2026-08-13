---
title: List Pim Rolegroups Without Owners (Scheduled)
description: List role-assignable groups with eligible role assignments but without owners
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Finds role-assignable groups that have PIM eligible role assignments but no owners assigned. Optionally sends an email alert containing the group names.

## Location
Organization → Security → List Pim Rolegroups Without Owners (Scheduled)

**Full Runbook name**

rjgit-org_security_list-pim-rolegroups-without-owners_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.Read.All
  - RoleManagement.Read.Directory
  - Mail.Send


## Parameters
### SendEmailIfFound

If set to true, sends an email when matching groups are found.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### From

Sender email address used to send the alert.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | reports@contoso.com |
| Type | String |
| Portal display name | Sender mail address |

### To

Recipient email address for the alert.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja-gab.com |
| Type | String |
| Portal display name | Send mail to |



[Back to Runbook Reference overview](../../README.md)

