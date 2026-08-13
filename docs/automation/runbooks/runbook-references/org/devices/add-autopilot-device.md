---
title: Add Autopilot Device
description: Import a Windows device into Windows Autopilot
---

## Description
This runbook imports a Windows device into Windows Autopilot using the device serial number and hardware hash.
It can optionally wait for the import job to finish and supports tagging during import.

## Location
Organization → Devices → Add Autopilot Device

**Full Runbook name**

rjgit-org_devices_add-autopilot-device

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

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
| Portal display name | 'Device Serial Number' from Get-WindowsAutopilotInfo |

### HardwareIdentifier

Device hardware hash as returned by Get-WindowsAutopilotInfo.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | 'Hardware Hash' from Get-WindowsAutopilotInfo |

### AssignedUser

Optional user to assign to the Autopilot device.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Assign device to this user (optional) |
| Hidden in portal | yes (preset via runbook customization) |

### Wait

If set to true, the runbook waits until the import job completes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Wait for job to finish |

### GroupTag

Optional group tag to apply to the imported device.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Group tag (optional) |



[Back to Runbook Reference overview](../../README.md)

