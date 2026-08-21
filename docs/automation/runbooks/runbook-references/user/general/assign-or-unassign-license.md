---
title: Assign Or Unassign License
description: Assign or remove a license for a user via group membership
---

## Description
Adds or removes a user to a dedicated license assignment group to control license allocation. The license group must match the configured naming convention.

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

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### GroupID_License

Object ID of the license assignment group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

"Assign the license to the user" (final value: $false) or "Remove the license from the user" (final value: $true) can be selected as action to perform.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Assign or Remove License |

**Portal options**

| Portal option | Value |
| --- | --- |
| Assign License to User | false |
| Remove License from User | true |



[Back to Runbook Reference overview](../../README.md)

