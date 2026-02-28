---
title: Unenroll Updatable Assets (Scheduled)
description: Unenroll devices from Windows Update for Business.
---

## Description
This runbook unenrolls all device members of a Microsoft Entra ID group from Windows Update for Business updatable assets.
You can remove a specific update category enrollment or delete the updatable asset registration entirely.
Use this to offboard devices from WUfB reporting or to reset their enrollment state.

## Location
Group → Devices → Unenroll Updatable Assets (Scheduled)

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.Read.All
  - WindowsUpdates.ReadWrite.All


## Parameters
### GroupId

Object ID of the group whose device members will be unenrolled.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### UpdateCategory

The update category to unenroll from. Supported values are driver, feature, quality, or all.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | all |
| Type | String |

### IncludeUserOwnedDevices

When enabled, the runbook also resolves all user members of the group (including nested groups) and unenrolls every device the user is owner of.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

