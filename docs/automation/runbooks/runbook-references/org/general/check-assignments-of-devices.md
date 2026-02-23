---
title: Check Assignments Of Devices
description: Check Intune assignments for one or more device names
---

## Description
This runbook queries Intune policies and optionally app assignments relevant to the specified device(s).
It resolves device group memberships and reports matching assignments.

## Location
Organization → General → Check Assignments Of Devices

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
  - Group.Read.All
  - DeviceManagementConfiguration.Read.All
  - DeviceManagementManagedDevices.Read.All
  - DeviceManagementApps.Read.All


## Parameters
### DeviceNames

Comma-separated list of device names to check.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### IncludeApps

If set to true, also evaluates application assignments.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

