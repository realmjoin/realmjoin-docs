---
title: Enroll Updatable Assets
description: Enroll device into Windows Update for Business.
---

## Description
This script enrolls devices into Windows Update for Business.

## Location
Device → General → Enroll Updatable Assets

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

Category of updates to enroll into. Possible values are: driver, feature or quality.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | feature |
| Type | String |


[Back to Table of Content](../../README.md)

