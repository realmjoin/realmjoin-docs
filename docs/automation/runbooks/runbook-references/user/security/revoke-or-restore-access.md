---
title: Revoke Or Restore Access
description: Block this user's sign-in and sessions, or restore access
---

## Description
Blocks this user from signing in and ends the current sessions, so stolen tokens stop working immediately, for example during an incident. Re-enable user lifts the block again; ended sessions are not restored.

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

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Revoke

Revoke access blocks sign-in and ends the sessions. Re-enable user lets the user sign in again.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Re-enable user | false |
| Revoke access | true |



[Back to Runbook Reference overview](../../README.md)

