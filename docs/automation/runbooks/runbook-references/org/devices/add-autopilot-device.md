---
title: Add Autopilot Device
description: Register a Windows device in Windows Autopilot
---

## Description
Registers a Windows device in Windows Autopilot from its serial number and hardware hash, as collected with Get-WindowsAutopilotInfo. Optionally a group tag is set during the import and the runbook waits until the import has finished.

## Location
Organization → Devices → Add Autopilot Device

**Full Runbook name**

rjgit-org_devices_add-autopilot-device

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.ReadWrite.All
    - *Imports the serial number and hardware hash as Autopilot device and polls the import job*
  - User.Read.All *(optional — feature: User assignment)*
    - *Resolves the assigned user's UPN when AssignedUser is provided*


## Parameters
### SerialNumber

Serial number of the device as reported by Get-WindowsAutopilotInfo.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Serial number |

### HardwareIdentifier

Hardware hash of the device as reported by Get-WindowsAutopilotInfo.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Hardware hash |

### AssignedUser

User to assign during the import. Microsoft no longer accepts this, so leave it empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Assign device to this user (optional) |
| Hidden in portal | yes (preset via runbook customization) |

### Wait

Keeps the runbook running until Autopilot has processed the import, so the result shows in the output.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Wait for the import to finish? |

### GroupTag

Group tag to set on the device, for example to steer it into an Autopilot profile. Leave empty for none.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Group tag |



[Back to Runbook Reference overview](../../README.md)

