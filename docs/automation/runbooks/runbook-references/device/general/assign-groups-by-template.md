---
title: Assign Groups By Template
description: Add this device to a predefined set of groups
---

## Description
Adds this device to one or more Entra ID groups. The groups come from a template that an administrator defines in the runbook customization, so the person running it picks a template instead of individual groups.

## Location
Device → General → Assign Groups By Template

**Full Runbook name**

rjgit-device_general_assign-groups-by-template

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.3 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
    - *Resolves the Entra device and reads its current group memberships*
  - Group.Read.All
    - *Looks up the template's target groups by display name or id and checks existing membership*
  - GroupMember.ReadWrite.All
    - *Adds the device to each template group via members@odata.bind*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### GroupsTemplate

Template that decides which groups the device joins. The available templates are set up in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Group template |

### GroupsString

Groups to add the device to, separated by commas. Usually filled in by the selected template.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Groups |

### UseDisplaynames

Whether the group list contains display names instead of object IDs. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

