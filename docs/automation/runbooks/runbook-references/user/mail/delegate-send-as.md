---
title: Delegate Send As
description: Grant or remove Send As permission on this user's mailbox
---

## Description
Lets another person send email as this user, so messages appear to come from this mailbox, or removes that permission again. The permissions are shown before and after the change.

## Location
User → Mail → Delegate Send As

**Full Runbook name**

rjgit-user_mail_delegate-send-as

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Grants, revokes and lists SendAs permissions in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session managing SendAs permissions*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### delegateTo

Person who gets or loses the Send As permission.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

Whether the permission is removed instead of granted. Set by the "Action" choice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

