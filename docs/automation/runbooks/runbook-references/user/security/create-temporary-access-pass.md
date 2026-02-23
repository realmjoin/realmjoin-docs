---
title: Create Temporary Access Pass
description: Create a temporary access pass for a user
---

## Description
Creates a new Temporary Access Pass (TAP) authentication method for a user in Microsoft Entra ID. Existing TAPs for the user are removed before creating a new one.

## Location
User → Security → Create Temporary Access Pass

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - UserAuthenticationMethod.ReadWrite.All


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### LifetimeInMinutes

Lifetime of the temporary access pass in minutes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 240 |
| Type | Int32 |

### OneTimeUseOnly

If set to true, the pass can be used only once.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

