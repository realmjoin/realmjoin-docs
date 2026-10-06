---
title: List User Devices
description: List the devices registered to this group's members
---

## Description
Lists the devices registered to the users in this group. Optionally the found devices are added to a device group of your choice. Devices are only added to that group, never removed.

## Location
Group → General → List User Devices

**Full Runbook name**

rjgit-group_general_list-user-devices

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
    - *Reads each member's registered devices via /users/{id}/registeredDevices*
  - Group.Read.All
    - *Enumerates the group's user members to know whose devices to list*
  - GroupMember.ReadWrite.All *(optional — feature: Move devices to group)*
    - *Adds the found devices to the target group*


## Parameters
### GroupID

Object ID of the group the runbook acts on. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### moveGroup

Whether the found devices are added to the chosen device group. Set by the "Action" choice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### targetgroup

Group the found devices are added to. Only used when "Action" adds the devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

