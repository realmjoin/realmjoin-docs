---
title: Rename Device
description: Rename a device.
---

## Description
Rename a device (in Intune and Autopilot).

## Location
Device → General → Rename Device

**Full Runbook name**

rjgit-device_general_rename-device

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
    - *Resolves the Entra device object via /devices before renaming*
  - DeviceManagementManagedDevices.Read.All
    - *Finds the Intune device by azureADDeviceId to get its Intune object id*
  - DeviceManagementServiceConfig.ReadWrite.All
    - *Reads the Autopilot identity and renames it via updateDeviceProperties*
  - DeviceManagementManagedDevices.PrivilegedOperations.All
    - *Triggers the privileged setDeviceName action on the Intune device*


## Parameters
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### NewDeviceName

The new device name to set. This runbook validates the name against common Windows hostname constraints.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

