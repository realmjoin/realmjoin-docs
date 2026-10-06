---
title: Rename Device
description: Rename this device in Intune and Autopilot
---

## Description
Gives this device a new name in Intune and in its Windows Autopilot record. Before anything is changed, the name is checked against the Windows computer name rules. It may have up to 15 letters, digits and hyphens, must start and end with a letter or digit, and cannot be digits only.

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

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### NewDeviceName

Up to 15 letters, digits and hyphens, starting and ending with a letter or digit, not digits only.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | New device name |



[Back to Runbook Reference overview](../../README.md)

