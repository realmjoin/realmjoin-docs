---
title: Add Or Remove User
description: Add or remove a group member
---

## Description
This runbook adds a user to a group or removes a user from a group.
It supports Microsoft Entra ID groups and Exchange Online distribution or mail-enabled security groups.
Use the Remove switch to remove the user instead of adding the user.

## Location
Group → General → Add Or Remove User

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - Group.ReadWrite.All
  - GroupMember.ReadWrite.All


## Parameters
### GroupID

Object ID of the target group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### UserId

Object ID of the user to add or remove.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

"Add User to Group" (final value: $false) or "Remove User from Group" (final value: $true) can be selected as action to perform. If set to true, the runbook will remove the user from the group. If set to false, it will add the user to the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

