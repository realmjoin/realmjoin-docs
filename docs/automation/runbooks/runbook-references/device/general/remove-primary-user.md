---
title: Remove Primary User
description: Remove the primary user from this device
---

## Description
Clears the primary user of this device in Intune. The device then has no assigned user, which is useful for shared devices or before handing the device to someone else. The user account itself is not changed.

## Location
Device → General → Remove Primary User

**Full Runbook name**

rjgit-device_general_remove-primary-user

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
    - *Removes the device's primary user via DELETE managedDevices('{id}')/users/$ref*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

