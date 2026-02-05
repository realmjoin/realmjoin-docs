---
title: Set Or Remove Mobile Phone Mfa
description: Add, update or remove a user's mobile phone MFA information.
---

## Description
Add, update or remove a user's mobile phone MFA information. If you want to modify a number, remove it first and add a new number afterwards.

## Location
User → Security → Set Or Remove Mobile Phone Mfa

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

### phoneNumber

Enter the user's mobile number in international format (e.g. +491701234567) to add, update, or remove.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

