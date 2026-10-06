---
title: Assign Or Unassign License
description: Assign or remove a license for this user via a license group
---

## Description
Adds this user to a license assignment group or removes the user from it, which assigns or removes the license the group carries.

## Location
User → General → Assign Or Unassign License

**Full Runbook name**

rjgit-user_general_assign-or-unassign-license

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
    - *Resolves the target user's object id by UPN*
  - GroupMember.ReadWrite.All
    - *Checks membership and adds or removes the user in the license group*
  - Group.ReadWrite.All
    - *Reads the group object to validate the LIC_ naming prefix*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### GroupID_License

Group that carries the license. Only groups whose name starts with LIC_ are offered.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

Assign adds the user to the group. Remove takes the user out of it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Assign license to user | false |
| Remove license from user | true |



[Back to Runbook Reference overview](../../README.md)

