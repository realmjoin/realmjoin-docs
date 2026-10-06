---
title: Enable Or Disable Password Expiration
description: Turn password expiration on or off for this user
---

## Description
Sets whether the password of this user expires. Turning expiration off keeps the current password valid indefinitely, for example for service or shared accounts; turning it on restores the tenant's default expiration.

## Location
User → Security → Enable Or Disable Password Expiration

**Full Runbook name**

rjgit-user_security_enable-or-disable-password-expiration

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
    - *Patches /users/{UPN} to set or clear the passwordPolicies attribute*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### DisablePasswordExpiration

Yes stops the password from expiring. No applies the tenant's default expiration again.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Disable password expiration? |



[Back to Runbook Reference overview](../../README.md)

