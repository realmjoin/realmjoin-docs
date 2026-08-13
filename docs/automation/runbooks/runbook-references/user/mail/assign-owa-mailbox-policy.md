---
title: Assign Owa Mailbox Policy
description: Assign an OWA mailbox policy to a user
---

## Description
Assigns an OWA mailbox policy to a mailbox in Exchange Online.
This can be used to enable or restrict features such as the ability to use email signatures in OWA or to enable the Bookings add-in for users who create Bookings appointments.

## Location
User → Mail → Assign Owa Mailbox Policy

**Full Runbook name**

rjgit-user_mail_assign-owa-mailbox-policy

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>ExchangeOnlineManagement (>= 3.9.0) |
| Schedulable | no |

## Permissions

### RBAC roles
- Exchange administrator


## Parameters
### UserName

User principal name of the target mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### OwaPolicyName

Name of the OWA mailbox policy to assign.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | OwaMailboxPolicy-Default |
| Type | String |

**Portal options**

| Portal option | Value |
| --- | --- |
| Default | OwaMailboxPolicy-Default |
| No signatures | OwaMailboxPolicy-NoSignatures |
| Bookings creators | BookingsCreators |
| Get current assignment | GetCurrent |



[Back to Runbook Reference overview](../../README.md)

