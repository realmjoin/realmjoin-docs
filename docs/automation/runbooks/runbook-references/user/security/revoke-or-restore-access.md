---
title: Revoke Or Restore Access
description: Revoke or restore user access
---

## Description
Blocks or re-enables a user account and optionally revokes active sign-in sessions. This can be used during incident response to immediately invalidate user tokens.

## Location
User → Security → Revoke Or Restore Access

**Full Runbook name**

rjgit-user_security_revoke-or-restore-access

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All
    - *Sets accountEnabled and revokes sign-in sessions on the user*

### RBAC roles
- User Administrator
  - *Required so blocking sign-in and revoking sessions also succeed for role-assigned users*


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Revoke

"(Re-)Enable User" (final value: $false) or "Revoke Access" (final value: $true) can be selected as action to perform. If set to true, the runbook will block the user from signing in and revoke active sessions. If set to false, it will re-enable the user account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| (Re-)Enable User | false |
| Revoke Access | true |



[Back to Runbook Reference overview](../../README.md)

