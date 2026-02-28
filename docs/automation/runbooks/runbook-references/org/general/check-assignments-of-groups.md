---
title: Check Assignments Of Groups
description: Check Intune assignments for one or more group names
---

## Description
This runbook queries Intune policies and optionally app assignments that target the specified group(s).
It resolves group IDs and reports matching assignments.

## Location
Organization → General → Check Assignments Of Groups

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - Group.Read.All
  - DeviceManagementConfiguration.Read.All
  - DeviceManagementManagedDevices.Read.All
  - DeviceManagementApps.Read.All
  - Device.Read.All


## Parameters
### GroupIDs

Group IDs of the groups to check assignments for

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String[] |

### IncludeApps

If set to true, also evaluates application assignments.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

