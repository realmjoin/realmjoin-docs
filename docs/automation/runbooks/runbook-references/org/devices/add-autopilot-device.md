---
title: Add Autopilot Device
description: Import a Windows device into Windows Autopilot
---

## Description
This runbook imports a Windows device into Windows Autopilot using the device serial number and hardware hash.
It can optionally wait for the import job to finish and supports tagging during import.

## Location
Organization → Devices → Add Autopilot Device

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.ReadWrite.All


## Parameters
### SerialNumber

Device serial number as returned by Get-WindowsAutopilotInfo.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### HardwareIdentifier

Device hardware hash as returned by Get-WindowsAutopilotInfo.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### AssignedUser

Optional user to assign to the Autopilot device.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Wait

If set to true, the runbook waits until the import job completes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### GroupTag

Optional group tag to apply to the imported device.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

