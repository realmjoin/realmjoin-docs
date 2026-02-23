---
title: Enable Or Disable Password Expiration
description: Enable or disable password expiration for a user
---

## Description
Updates the password policy for a user in Microsoft Entra ID. This can be used to disable password expiration or re-enable the default expiration behavior.

## Location
User → Security → Enable Or Disable Password Expiration

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

### DisablePasswordExpiration

If set to true, disables password expiration for the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

