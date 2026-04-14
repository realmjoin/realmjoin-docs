---
title: Assign Groups By Template
description: Assign cloud-only groups to a device based on a template
---

## Description
Adds a device to one or more Entra ID groups using either group object IDs or display names. The list of groups is typically provided via runbook customization templates.

## Location
Device → General → Assign Groups By Template

**Full Runbook name**

rjgit-device_general_assign-groups-by-template

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
  - Group.Read.All
  - GroupMember.ReadWrite.All


## Parameters
### DeviceId

ID of the target device in Microsoft Graph.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### GroupsTemplate

Template selector used by portal customization to populate the group list.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GroupsString

Comma-separated list of group object IDs or group display names.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### UseDisplaynames

If set to true, treats values in GroupsString as group display names instead of IDs.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

