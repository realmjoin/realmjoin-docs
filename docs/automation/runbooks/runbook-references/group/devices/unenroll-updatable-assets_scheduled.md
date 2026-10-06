---
title: Unenroll Updatable Assets (Scheduled)
description: Unenroll this group's devices from Windows Update for Business
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Removes every device in this group from Windows Update for Business, either for one update category or by deleting the updatable asset registration entirely. Optionally the devices owned by the group's user members are included. Use it to offboard devices from Windows Update for Business reporting or to reset their enrollment.

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

Object ID of the group the runbook acts on. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### UpdateCategory

Update category (driver, feature or quality) to unenroll the devices from. Choose all to delete the updatable asset registration entirely.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | all |
| Type | String |
| Portal display name | Update category |

### IncludeUserOwnedDevices

Also unenrolls every device owned by the users in this group, nested groups included.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include devices owned by user members? |



[Back to Runbook Reference overview](../../README.md)

