---
title: Unenroll Updatable Assets
description: Unenroll device from Windows Update for Business.
---

## Description
This script unenrolls devices from Windows Update for Business.

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

DeviceId of the device to unenroll.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### UpdateCategory

Category of updates to unenroll from. Possible values are: driver, feature, quality or all (delete).

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | all |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

