---
title: Add Or Remove Safelinks Exclusion
description: Add or remove a SafeLinks URL exclusion from a policy
---

## Description
Adds or removes a SafeLinks URL pattern exclusion in a specified policy. The runbook can also list existing policies and can create a new policy and group if needed.

## Location
Organization → General → Add Or Remove Safelinks Exclusion

**Full Runbook name**

rjgit-org_general_add-or-remove-safeLinks-exclusion

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | ExchangeOnlineManagement (>= 3.9.2)<br>RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Manages Safe Links policies, rules and the assignment group in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session updating DoNotRewriteUrls*


## Parameters
### Action

"Add URL Pattern to Policy", "Remove URL Pattern from Policy" or "List all existing policies and settings" could be selected as action to perform.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |
| Portal display name | Add or Remove URL Pattern to/from Policy |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add URL Pattern to Policy |  |
| Remove URL Pattern from Policy |  |
| List all existing policies and settings |  |

### LinkPattern

URL pattern to allow; it can contain '*' as a wildcard for host and paths.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | https://*.microsoft.com/* |
| Type | String |

### DefaultPolicyName

Default SafeLinks policy name used when no explicit policy name is provided.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Default SafeLinks Policy |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### PolicyName

Optional SafeLinks policy name; if provided, it overrides the default selection.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CreateNewPolicyIfNeeded

If set to true, the runbook creates a new SafeLinks policy and assignment group when the requested policy does not exist.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

