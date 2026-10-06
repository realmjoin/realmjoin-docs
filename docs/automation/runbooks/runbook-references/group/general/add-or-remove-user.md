---
title: Add Or Remove User
description: Add a user to this group or remove one
---

## Description
Adds a user as a member of this group or removes an existing member. Works for Microsoft Entra ID groups as well as Exchange Online distribution and mail-enabled security groups.

## Location
Group → General → Add Or Remove User

**Full Runbook name**

rjgit-group_general_add-or-remove-user

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.3 |
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

Object ID of the group the runbook acts on. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### UserId

User who is added to or removed from the group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

Add makes the user a member. Remove takes the membership away.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add user as member | false |
| Remove user as member | true |



[Back to Runbook Reference overview](../../README.md)

