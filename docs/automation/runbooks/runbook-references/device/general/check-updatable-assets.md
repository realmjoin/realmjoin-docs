---
title: Check Updatable Assets
description: Check whether this device is enrolled in Windows Update for Business
---

## Description
Shows whether this device is registered as an updatable asset in the Windows Update for Business deployment service. Nothing is changed on the device.

## Location
Device → General → Check Updatable Assets

**Full Runbook name**

rjgit-device_general_check-updatable-assets

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - WindowsUpdates.ReadWrite.All
    - *Reads the device's Windows Update for Business enrollment state and errors via updatableAssets*
  - Device.Read.All
    - *Resolves the device's display name via /devices for the status output*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

