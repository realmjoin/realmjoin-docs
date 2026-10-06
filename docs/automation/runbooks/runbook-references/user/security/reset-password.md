---
title: Reset Password
description: Set a new password for this user
---

## Description
Sets a new password for this user in Entra ID and shows it in the output. A disabled account can be enabled first, and the user can be made to choose their own password at the next sign-in.

## Location
User → Security → Reset Password

**Full Runbook name**

rjgit-user_security_reset-password

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### RBAC roles
- User Administrator
  - *Required for the app-only password reset via PATCH /users/{id} passwordProfile*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### EnableUserIfNeeded

Enables a disabled account before the password is set.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Enable the account if disabled? |

### ForceChangePasswordNextSignIn

Makes the user choose their own password at the next sign-in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Require a new password at next sign-in? |



[Back to Runbook Reference overview](../../README.md)

