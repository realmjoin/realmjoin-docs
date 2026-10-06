---
title: Add Or Remove Safelinks Exclusion
description: Allow a URL pattern in a Safe Links policy or remove it
---

## Description
Adds a URL pattern to the exclusions of a Microsoft Defender Safe Links policy so links matching it are no longer rewritten, or removes such an exclusion. It can also list the existing policies with their settings, and create a policy with its assignment group when the requested one does not exist.

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

Add puts the pattern on the exclusion list, Remove takes it off, List shows the policies and their settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add URL pattern to policy | 0 |
| Remove URL pattern from policy | 1 |
| List all existing policies and settings | 2 |

### LinkPattern

Pattern to exclude; * works as a wildcard for host and path, for example https://*.microsoft.com/*.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | https://*.microsoft.com/* |
| Type | String |

### DefaultPolicyName

Policy used when no policy name is given.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Default SafeLinks Policy |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### PolicyName

Policy to change. Leave empty to use the default policy.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CreateNewPolicyIfNeeded

Creates the Safe Links policy and its assignment group when it does not exist yet.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

