---
title: Confirm Or Dismiss Risky User
description: Confirm this user as compromised or dismiss the risk
---

## Description
Tells Microsoft Entra ID Protection what to do with the risk flagged on this user. Confirm compromise marks the account as compromised, which sets the user risk to high. Dismiss risk clears the flag when the activity was legitimate.

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

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Dismiss

Confirm compromise marks the account as compromised. Dismiss risk clears the risk flag.

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

