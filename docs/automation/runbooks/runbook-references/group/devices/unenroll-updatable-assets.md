---
title: Unenroll Updatable Assets
description: Unenroll devices from Windows Update for Business.
---

## Description
This script unenrolls devices from Windows Update for Business.

## Location
Group → Devices → Unenroll Updatable Assets

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.Read.All
  - WindowsUpdates.ReadWrite.All


## Parameters
### GroupId

Object ID of the group to unenroll its members.

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



[Back to Runbook Reference overview](../../README.md)

