---
title: Reset Mobile Device Pin
description: Reset a mobile device's password/PIN code.
---

## Description
This runbook triggers an Intune reset passcode action for a managed mobile device.
The action is only supported for certain, corporate-owned device types and will be rejected for personal or unsupported devices.

## Location
Device → Security → Reset Mobile Device Pin

**Full Runbook name**

rjgit-device_security_reset-mobile-device-pin

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
  - DeviceManagementManagedDevices.PrivilegedOperations.All


## Parameters
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

