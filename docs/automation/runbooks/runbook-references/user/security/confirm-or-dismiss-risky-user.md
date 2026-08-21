---
title: Confirm Or Dismiss Risky User
description: Confirm compromise or dismiss a risky user
---

## Description
Confirms a user compromise or dismisses a risky user entry using Microsoft Entra ID Identity Protection. This helps security teams remediate and track risky sign-in events.

## Location
User → Security → Confirm Or Dismiss Risky User

**Full Runbook name**

rjgit-user_security_confirm-or-dismiss-risky-user

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - IdentityRiskyUser.ReadWrite.All
    - *Reads the risky user and posts dismiss or confirmCompromised to change the risk state*


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Dismiss

"Confirm compromise" (final value: $false) or "Dismiss risk" (final value: $true) can be selected as action to perform. If set to true, the runbook will attempt to dismiss the risky user entry for the target user. If set to false, it will attempt to confirm a compromise for the target user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Confirm compromise | false |
| Dismiss risk | true |



[Back to Runbook Reference overview](../../README.md)

