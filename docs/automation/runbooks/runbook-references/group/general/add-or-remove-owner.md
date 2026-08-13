---
title: Add Or Remove Owner
description: Add or remove a Office 365 group owner
---

## Description
This runbook adds a user as an owner of a group or removes an existing owner.
For Microsoft 365 groups, it also ensures that newly added owners are members of the group.
Use the Remove switch to remove ownership instead of adding it.

## Location
Group → General → Add Or Remove Owner

**Full Runbook name**

rjgit-group_general_add-or-remove-owner

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - Group.ReadWrite.All
  - GroupMember.ReadWrite.All
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### GroupID

Object ID of the target group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### UserId

Object ID of the user to add or remove.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

"Add User as Owner" (final value: $false) or "Remove User as Owner" (final value: $true) can be selected as action to perform. If set to true, the runbook will remove the user from the group owners. If set to false, it will add the user as an owner of the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Add or Remove Owner |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add User as Owner | false |
| Remove User as Owner | true |



[Back to Runbook Reference overview](../../README.md)

