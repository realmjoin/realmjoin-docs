---
title: Add Devices Of Users To Group (Scheduled)
description: Sync devices of users in a specific group to another device group
---

## Description
This runbook reads accounts from a specified users group and adds their devices to a specified device group.
It can filter devices by operating system and keeps the target group in sync.

## Location
Organization → General → Add Devices Of Users To Group (Scheduled)

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

### DeviceGroup

Name or object ID of the device group, to which the devices should be added.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### IncludeWindowsDevice

If set to true, includes Windows devices in the target device group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeMacOSDevice

If set to true, includes macOS devices in the target device group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeLinuxDevice

If set to true, includes Linux devices in the target device group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeAndroidDevice

If set to true, includes Android devices in the target device group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeIOSDevice

If set to true, includes iOS devices in the target device group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeIPadOSDevice

If set to true, includes iPadOS devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

