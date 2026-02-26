---
title: Delegate Send As
description: Delegate SendAs permissions for other user on his/her mailbox or remove existing delegation
---

## Description
Grants or removes SendAs permissions for a delegate on a mailbox in Exchange Online. The current permissions are shown before and after applying the change.
This allows the delegate to send emails as if they were the mailbox owner.

## Location
User → Mail → Delegate Send As

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online API
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



[Back to Runbook Reference overview](../../README.md)

