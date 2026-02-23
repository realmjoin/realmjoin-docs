---
title: Revoke Or Restore Access
description: Revoke or restore user access
---

## Description
Blocks or re-enables a user account and optionally revokes active sign-in sessions. This can be used during incident response to immediately invalidate user tokens.

## Location
User → Security → Revoke Or Restore Access

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All

### RBAC roles
- User Administrator


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Revoke

"(Re-)Enable User" (final value: $false) or "Revoke Access" (final value: $true) can be selected as action to perform. If set to true, the runbook will block the user from signing in and revoke active sessions. If set to false, it will re-enable the user account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

