---
title: Assign Owa Mailbox Policy
description: Assign an Outlook on the web policy to this user's mailbox
---

## Description
Assigns an Outlook on the web (OWA) mailbox policy to the mailbox of this user. Policies switch features on or off, for example email signatures in the web client or the Bookings add-in for people who create Bookings appointments. Get current assignment shows the policy in place without changing it.

## Location
User → Mail → Assign Owa Mailbox Policy

**Full Runbook name**

rjgit-user_mail_assign-owa-mailbox-policy

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Runs Get-/Set-CasMailbox in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Runs Get-/Set-CasMailbox to assign the OWA mailbox policy to the mailbox*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### OwaPolicyName

Policy to assign. Get current assignment only shows which policy the mailbox has today.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | OwaMailboxPolicy-Default |
| Type | String |
| Portal display name | Policy |

**Portal options**

| Portal option | Value |
| --- | --- |
| Default | OwaMailboxPolicy-Default |
| No signatures | OwaMailboxPolicy-NoSignatures |
| Bookings creators | BookingsCreators |
| Get current assignment | GetCurrent |



[Back to Runbook Reference overview](../../README.md)

