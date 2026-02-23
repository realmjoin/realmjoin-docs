---
title: Confirm Or Dismiss Risky User
description: Confirm compromise or dismiss a risky user
---

## Description
Confirms a user compromise or dismisses a risky user entry using Microsoft Entra ID Identity Protection. This helps security teams remediate and track risky sign-in events.

## Location
User → Security → Confirm Or Dismiss Risky User

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - IdentityRiskyUser.ReadWrite.All


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Dismiss

"Confirm compromise" (final value: $false) or "Dismiss risk" (final value: $true) can be selected as action to perform. If set to true, the runbook will attempt to dismiss the risky user entry for the target user. If set to false, it will attempt to confirm a compromise for the target user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

