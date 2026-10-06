---
title: Change Grouptag
description: Assign a new Autopilot group tag to this device
---

## Description
Sets a new Windows Autopilot group tag on this device. The group tag decides which Autopilot profile and, through dynamic groups, which policies and apps the device gets, so changing it prepares the device for a different deployment. Nothing else on the device is changed.

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

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### newGroupTag

Group tag that decides which Autopilot profile and dynamic groups the device gets.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | New group tag |



[Back to Runbook Reference overview](../../README.md)

