---
title: Reset Password
description: Reset a user's password
---

## Description
Resets the password for a user in Microsoft Entra ID and optionally enables the account first. The user can be forced to change the password at the next sign-in. This runbook is useful for helpdesk scenarios where a technician needs to reset a user's password and ensure that the user updates it upon next login.

## Location
User → Security → Reset Password

## Permissions
### RBAC roles
- User administrator


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### EnableUserIfNeeded

If set to true, enables the user account before resetting the password.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ForceChangePasswordNextSignIn

If set to true, forces the user to change the password at the next sign-in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

