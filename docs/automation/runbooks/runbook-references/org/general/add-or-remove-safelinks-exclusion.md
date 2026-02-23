---
title: Add Or Remove Safelinks Exclusion
description: Add or remove a SafeLinks URL exclusion from a policy
---

## Description
Adds or removes a SafeLinks URL pattern exclusion in a specified policy. The runbook can also list existing policies and can create a new policy and group if needed.

## Location
Organization → General → Add Or Remove Safelinks Exclusion

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### Action

"Add URL Pattern to Policy", "Remove URL Pattern from Policy" or "List all existing policies and settings" could be selected as action to perform.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |

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

