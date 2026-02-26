---
title: Delegate Send On Behalf
description: Delegate SendOnBehalf permissions for the user's mailbox
---

## Description
Grants or removes SendOnBehalf permissions for a delegate on the user's mailbox. Outputs the resulting SendOnBehalf trustees after applying the change.
This allows the delegate to send emails on behalf of the mailbox owner.

## Location
User → Mail → Delegate Send On Behalf

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

