---
title: Remove Primary User
description: Removes the primary user from a device.
---

## Description
This script removes the assigned primary user from a specified Azure AD device.
It requires the DeviceId of the target device and the name of the caller for auditing purposes.

## Location
Device → General → Remove Primary User

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.ReadWrite.All


## Parameters
### DeviceId

The unique identifier of the device from which the primary user will be removed.
It will be prefilled from the RealmJoin Portal and is hidden in the UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

