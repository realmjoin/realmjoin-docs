---
title: List Pim Rolegroups Without Owners (Scheduled)
description: Alert on PIM role groups that have no owner
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Finds role-assignable groups that hold eligible PIM role assignments but have no owner, so nobody is responsible for their membership. The group names are listed and can be sent by email. Nothing is changed.

## Location
Organization → Security → List Pim Rolegroups Without Owners (Scheduled)

**Full Runbook name**

rjgit-org_security_list-pim-rolegroups-without-owners_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.Read.All
    - *Lists role-assignable groups and reads their owners to find ownerless ones*
  - RoleManagement.Read.Directory
    - *Queries roleEligibilitySchedules per group to detect PIM-eligible role assignments*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the alert email via /users/{From}/sendMail when ownerless PIM groups were found*
  - Organization.Read.All *(optional — feature: Email report)*
    - *Reads the tenant's verified domain for the alert email body*


## Parameters
### SendEmailIfFound

Sends an email with the group names when such groups are found.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Send an email when groups are found? |

### From

User in the tenant the alert is sent as; needs a mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | reports@contoso.com |
| Type | String |
| Portal display name | Alert sender |

### To

Gets the email with the group names.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja-gab.com |
| Type | String |
| Portal display name | Alert recipient |



[Back to Runbook Reference overview](../../README.md)

