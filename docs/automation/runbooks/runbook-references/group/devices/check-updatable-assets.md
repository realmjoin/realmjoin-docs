---
title: Check Updatable Assets
description: Check Windows Update for Business enrollment of this group's devices
---

## Description
Checks for every device in this group whether it is registered as an updatable asset in Windows Update for Business. The result shows the enrollment state per update category and any error Windows Update returns. Nothing is changed.

## Location
Group → Devices → Check Updatable Assets

**Full Runbook name**

rjgit-group_devices_check-updatable-assets

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
    - *Reads the device members' properties (deviceId, displayName) to identify devices to check*
  - Group.Read.All
    - *Enumerates the group members via /groups/{id}/members to find device members*
  - WindowsUpdates.ReadWrite.All
    - *Queries the Windows Update for Business enrollment state per device via updatableAssets*

### Permission notes
Azure: Contributor on Storage Account


## Parameters
### GroupId

Object ID of the group the runbook acts on. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

