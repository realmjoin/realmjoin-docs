---
title: Enroll Updatable Assets
description: Enroll this device in Windows Update for Business
---

## Description
Registers this device as an updatable asset in Windows Update for Business for the chosen update category, so Intune can manage driver, feature or quality updates for it. All enrolls it in driver, feature and quality updates.

## Location
Device → General → Enroll Updatable Assets

**Full Runbook name**

rjgit-device_general_enroll-updatable-assets

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
    - *Enrolls the device per update category via updatableAssets/enrollAssets*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### UpdateCategory

Update category to enroll the device in. All enrolls it in driver, feature and quality updates.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Feature |
| Type | String |
| Portal display name | Update category |



[Back to Runbook Reference overview](../../README.md)

