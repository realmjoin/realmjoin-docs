---
title: Unenroll Updatable Assets
description: Unenroll this device from Windows Update for Business
---

## Description
Removes this device from Windows Update for Business for the chosen update category. Choosing all removes the device as an updatable asset altogether, so Intune no longer manages driver, feature or quality updates for it through the deployment service.

## Location
Device → General → Unenroll Updatable Assets

**Full Runbook name**

rjgit-device_general_unenroll-updatable-assets

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - WindowsUpdates.ReadWrite.All
    - *Unenrolls the device via updatableAssets DELETE or unenrollAssets*


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

Update category to unenroll the device from. Choosing all removes the device from Windows Update for Business entirely.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | all |
| Type | String |
| Portal display name | Update category |



[Back to Runbook Reference overview](../../README.md)

