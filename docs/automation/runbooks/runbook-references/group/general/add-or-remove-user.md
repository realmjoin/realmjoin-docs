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

**Full Runbook name**

rjgit-group_general_add-or-remove-user

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
    - *Resolves the target user before adding or removing the membership*
  - Group.ReadWrite.All
    - *Reads the target group and backs the member changes*
  - GroupMember.ReadWrite.All
    - *Checks membership and adds or removes the user via /groups/{id}/members/$ref*
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp *(optional — feature: Mail-enabled groups)*
    - *Manages members via the Exchange Online distribution group cmdlets*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session managing distribution group members*


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

"Add User to Group" (final value: $false) or "Remove User from Group" (final value: $true) can be selected as action to perform. If set to true, the runbook will remove the user from the group. If set to false, it will add the user to the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Add or Remove User |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add User as member | false |
| Remove User as member | true |



[Back to Runbook Reference overview](../../README.md)

