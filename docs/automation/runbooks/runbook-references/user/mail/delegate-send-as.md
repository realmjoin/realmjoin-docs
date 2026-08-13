---
title: Delegate Send As
description: Delegate SendAs permissions for other user on his/her mailbox or remove existing delegation
---

## Description
Grants or removes SendAs permissions for a delegate on a mailbox in Exchange Online. The current permissions are shown before and after applying the change.
This allows the delegate to send emails as if they were the mailbox owner.

## Location
User → Mail → Delegate Send As

**Full Runbook name**

rjgit-user_mail_delegate-send-as

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>ExchangeOnlineManagement (>= 3.9.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### UserName

User principal name of the mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### delegateTo

User principal name of the delegate.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

If set to true, removes the delegation instead of granting it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

