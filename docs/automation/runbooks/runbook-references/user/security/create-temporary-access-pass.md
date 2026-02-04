---
title: Create Temporary Access Pass
description: Create an AAD temporary access pass for a user.
---

## Description
Create an AAD temporary access pass for a user.

## Location
User → Security → Create Temporary Access Pass

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - UserAuthenticationMethod.ReadWrite.All


## Parameters
### UserName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### LifetimeInMinutes

Time the pass will stay valid in minutes

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 240 |
| Type | Int32 |

### OneTimeUseOnly



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |


[Back to Table of Content](../../README.md)

