---
title: Enable Or Disable Password Expiration
description: Enable or disable password expiration for a user
---

## Description
Updates the password policy for a user in Microsoft Entra ID. This can be used to disable password expiration or re-enable the default expiration behavior.

## Location
User → Security → Enable Or Disable Password Expiration

**Full Runbook name**

rjgit-user_security_enable-or-disable-password-expiration

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### DisablePasswordExpiration

If set to true, disables password expiration for the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Disable Password Expiration? |



[Back to Runbook Reference overview](../../README.md)

