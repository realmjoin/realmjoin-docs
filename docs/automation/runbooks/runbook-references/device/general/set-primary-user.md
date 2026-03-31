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

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.ReadWrite.All
  - User.Read.All


## Parameters
### DeviceId

The Entra Object ID of the device. Pre-filled from the RealmJoin Portal and hidden in the UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### NewPrimaryUserId

The user to assign as the new primary user of the device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

