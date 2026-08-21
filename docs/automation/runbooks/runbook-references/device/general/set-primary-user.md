---
title: Set Primary User
description: Set a new primary user on a managed Intune device
---

## Description
This runbook assigns a new primary user to an Intune managed device. It resolves the Intune managed device from the Entra Object ID provided by the portal, retrieves the current primary user and device details, removes the existing user assignment, and then sets the specified user as the new primary user. The output shows the previous and new assignment for audit purposes.

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

The Entra Object ID of the device. Pre-filled from the RealmJoin Portal and hidden in the UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### NewPrimaryUserId

The user to assign as the new primary user of the device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | New Primary User |



[Back to Runbook Reference overview](../../README.md)

