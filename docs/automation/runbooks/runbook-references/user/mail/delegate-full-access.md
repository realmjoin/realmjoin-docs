---
title: Delegate Full Access
description: Delegate FullAccess permissions to another user on a mailbox or remove existing delegation
---

## Description
Grants or removes FullAccess permissions for a delegate on a mailbox. Optionally enables Outlook automapping when granting access.
Also shows the current and new permissions for the mailbox.
Automapping allows the delegated mailbox to automatically appear in the delegate's Outlook client.

## Location
User → Mail → Delegate Full Access

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

### AutoMapping

If set to true, enables Outlook automapping when granting FullAccess.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

