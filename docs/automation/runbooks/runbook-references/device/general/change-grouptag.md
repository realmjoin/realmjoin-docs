---
title: Change Grouptag
description: Assign a new AutoPilot GroupTag to this device.
---

## Description
This Runbook assigns a new AutoPilot GroupTag to the device. This can be used to trigger a new deployment with different policies and applications for the device.

## Location
Device → General → Change Grouptag

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
  - DeviceManagementServiceConfig.ReadWrite.All


## Parameters
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### newGroupTag

The new AutoPilot GroupTag to assign to the device.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

