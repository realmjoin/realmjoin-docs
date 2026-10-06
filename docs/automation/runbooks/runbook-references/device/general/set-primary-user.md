---
title: Set Primary User
description: Set a new primary user on this device
---

## Description
Assigns the chosen user as the new primary user of this device in Intune and replaces the current one. The output shows the previous and the new assignment.

## Location
Device → General → Set Primary User

**Full Runbook name**

rjgit-device_general_set-primary-user

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.ReadWrite.All
    - *Resolves the Intune device and replaces its primary user via managedDevices('{id}')/users/$ref*
  - User.Read.All
    - *Resolves the new primary user's UPN and display name before assignment*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### NewPrimaryUserId

User to assign. The current primary user is replaced; both are shown in the output.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

