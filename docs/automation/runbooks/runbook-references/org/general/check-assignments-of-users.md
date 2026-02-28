---
title: Check Assignments Of Users
description: Check Intune assignments for one or more user principal names
---

## Description
This runbook queries Intune policies and optionally app assignments relevant to the specified user(s).
It resolves transitive group membership and reports matching assignments.

## Location
Organization → General → Check Assignments Of Users

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
### UserPrincipalName

User Principal Names of the users to check assignments for.

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

