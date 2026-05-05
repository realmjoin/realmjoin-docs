---
title: Enroll Updatable Assets
description: Enroll device into Windows Update for Business
---

## Description
This script enrolls a device into Windows Update for Business by registering it as an updatable asset for the specified update category.

## Location
Device → General → Enroll Updatable Assets

**Full Runbook name**

rjgit-device_general_enroll-updatable-assets

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - WindowsUpdates.ReadWrite.All


## Parameters
### DeviceId

DeviceId of the device to enroll.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### UpdateCategory

Category of updates to enroll into. Possible values are: Driver, Feature, Quality or All. Selecting All will enroll the device into all three categories sequentially.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Feature |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

