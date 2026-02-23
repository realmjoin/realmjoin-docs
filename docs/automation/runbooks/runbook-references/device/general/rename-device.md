---
title: Rename Device
description: Rename a device.
---

## Description
Rename a device (in Intune and Autopilot).

## Location
Device → General → Rename Device

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
  - DeviceManagementManagedDevices.Read.All
  - DeviceManagementServiceConfig.ReadWrite.All
  - DeviceManagementManagedDevices.PrivilegedOperations.All


## Parameters
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### NewDeviceName

The new device name to set. This runbook validates the name against common Windows hostname constraints.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

