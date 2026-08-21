---
title: Unenroll Updatable Assets (Scheduled)
description: Unenroll devices from Windows Update for Business.
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
This runbook unenrolls all device members of a Microsoft Entra ID group from Windows Update for Business updatable assets.
You can remove a specific update category enrollment or delete the updatable asset registration entirely.
Use this to offboard devices from WUfB reporting or to reset their enrollment state.

## Location
Group → Devices → Unenroll Updatable Assets (Scheduled)

**Full Runbook name**

rjgit-group_devices_unenroll-updatable-assets_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.Read.All
    - *Reads the group's transitive device and user members to find devices to unenroll*
  - WindowsUpdates.ReadWrite.All
    - *Unenrolls each device via updatableAssets DELETE or unenrollAssets*
  - User.Read.All *(optional — feature: User-owned devices)*
    - *Reads each user member's owned devices via /users/{id}/ownedDevices when IncludeUserOwnedDevices is enabled*


## Parameters
### GroupId

Object ID of the group whose device members will be unenrolled.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

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

