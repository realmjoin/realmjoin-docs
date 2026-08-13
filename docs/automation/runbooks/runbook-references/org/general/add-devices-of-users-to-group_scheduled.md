---
title: Add Devices Of Users To Group (Scheduled)
description: Sync devices of users in a specific group to another device group
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
This runbook reads accounts from a specified users group and adds their devices to a specified device group.
It can filter devices by operating system and keeps the target group in sync.

## Location
Organization → General → Add Devices Of Users To Group (Scheduled)

**Full Runbook name**

rjgit-org_general_add-devices-of-users-to-group_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All
  - User.Read.All
  - GroupMember.ReadWrite.All


## Parameters
### UserGroup

Name or object ID of the users group, to which the target users belong.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Name or Object ID of the Users Group |

### DeviceGroup

Name or object ID of the device group, to which the devices should be added.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Name or Object ID of the Devices Group |

### IncludeWindowsDevice

If set to true, includes Windows devices in the target device group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Windows Devices (Default: False) |

### IncludeMacOSDevice

If set to true, includes macOS devices in the target device group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include MacOS-Devices (Default: False) |

### IncludeLinuxDevice

If set to true, includes Linux devices in the target device group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Linux Devices (Default: False) |

### IncludeAndroidDevice

If set to true, includes Android devices in the target device group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Android Devices (Default: False) |

### IncludeIOSDevice

If set to true, includes iOS devices in the target device group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include iOS-Devices (Default: False) |

### IncludeIPadOSDevice

If set to true, includes iPadOS devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include iPadOS-Devices (Default: False) |



[Back to Runbook Reference overview](../../README.md)

