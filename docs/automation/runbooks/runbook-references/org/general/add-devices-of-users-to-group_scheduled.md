---
title: Add Devices Of Users To Group (Scheduled)
description: Add the devices of a user group's members to a device group
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Adds the devices of all users in a user group to a device group on every run, so device-based policies can follow user membership. Devices already in the group are skipped, and nothing is removed.

## Location
Organization → General → Add Devices Of Users To Group (Scheduled)

**Full Runbook name**

rjgit-org_general_add-devices-of-users-to-group_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All
    - *Resolves the groups by display name and backs adding devices to the device group*
  - User.Read.All
    - *Lists the user group's transitive user members and reads each user's owned devices*
  - GroupMember.ReadWrite.All
    - *Reads current device-group members and adds missing devices via /groups/{id}/members/$ref*


## Parameters
### UserGroup

Name or object ID of the group whose members' devices are collected.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | User group |

### DeviceGroup

Name or object ID of the group the devices are added to.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Device group |

### IncludeWindowsDevice

Includes Windows devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Windows devices? |

### IncludeMacOSDevice

Includes macOS devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include macOS devices? |

### IncludeLinuxDevice

Includes Linux devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Linux devices? |

### IncludeAndroidDevice

Includes Android devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Android devices? |

### IncludeIOSDevice

Includes iOS devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include iOS devices? |

### IncludeIPadOSDevice

Includes iPadOS devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include iPadOS devices? |



[Back to Runbook Reference overview](../../README.md)

