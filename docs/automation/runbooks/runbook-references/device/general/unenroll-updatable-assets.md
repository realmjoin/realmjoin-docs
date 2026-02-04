---
title: Unenroll Updatable Assets
description: Unenroll device from Windows Update for Business.
---

## Description
This script unenrolls devices from Windows Update for Business.

## Location
Device → General → Unenroll Updatable Assets

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - WindowsUpdates.ReadWrite.All


## Parameters
### DeviceId

DeviceId of the device to unenroll.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### UpdateCategory

Category of updates to unenroll from. Possible values are: driver, feature, quality or all (delete).

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | all |
| Type | String |


[Back to Table of Content](../../README.md)

