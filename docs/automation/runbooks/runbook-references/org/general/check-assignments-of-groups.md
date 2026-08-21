---
title: Check Assignments Of Groups
description: Check Intune assignments for one or more group names
---

## Description
This runbook queries Intune policies and optionally app assignments that target the specified group(s).
It resolves group IDs and reports matching assignments.

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

Group IDs of the groups to check assignments for

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String[] |
| Portal display name | One or more groups to check assignments for |

### IncludeApps

If set to true, also evaluates application assignments.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include app assignments |



[Back to Runbook Reference overview](../../README.md)

