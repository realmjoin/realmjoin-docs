---
title: Change Grouptag
description: Assign a new AutoPilot GroupTag to this device.
---

## Description
This Runbook assigns a new AutoPilot GroupTag to the device. This can be used to trigger a new deployment with different policies and applications for the device.

## Location
Device → General → Change Grouptag

**Full Runbook name**

rjgit-device_general_change-groupTag

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
    - *Resolves the Entra device via /devices to get its display name*
  - DeviceManagementServiceConfig.ReadWrite.All
    - *Reads the Autopilot identity and sets the new group tag via updateDeviceProperties*


## Parameters
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### newGroupTag

The new AutoPilot GroupTag to assign to the device.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

