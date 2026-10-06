---
title: Check Assignments Of Groups
description: Show which Intune policies and apps target given groups
---

## Description
Lists the Intune policies, and optionally the apps, that are assigned to one or more groups. Nothing is changed.

## Location
Organization → General → Check Assignments Of Groups

**Full Runbook name**

rjgit-org_general_check-assignments-of-groups

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.Read.All
    - *Reads each target group via /groups('{id}') to resolve its display name*
  - DeviceManagementConfiguration.Read.All
    - *Lists Intune configuration, group policy and compliance policies and their assignments*
  - DeviceManagementApps.Read.All
    - *Lists mobile apps and their assignments when IncludeApps is enabled*


## Parameters
### GroupIDs

Assignments are matched against each picked group directly; assignments to parent groups are not included.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String[] |
| Portal display name | Groups |

### IncludeApps

Also lists the apps assigned to the groups.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include app assignments? |



[Back to Runbook Reference overview](../../README.md)

