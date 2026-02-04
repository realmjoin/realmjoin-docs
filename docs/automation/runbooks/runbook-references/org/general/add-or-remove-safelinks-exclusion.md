---
title: Add Or Remove Safelinks Exclusion
description: Add or remove a SafeLinks URL exclusion to/from a given policy.
---

## Description
Add or remove a SafeLinks URL exclusion to/from a given policy.
It can also be used to initially create a new policy if required.

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



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |

### LinkPattern

URL to allow, can contain '*' as wildcard for host and paths

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | https://*.microsoft.com/* |
| Type | String |

### DefaultPolicyName

If only one policy exists, no need to specify. Will use "DefaultPolicyName" as default otherwise.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Default SafeLinks Policy |
| Type | String |

### PolicyName

Optional, will overwrite default values

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CreateNewPolicyIfNeeded



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |


[Back to Table of Content](../../README.md)

