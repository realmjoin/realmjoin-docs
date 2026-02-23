---
title: Outphase Devices
description: Remove or outphase multiple devices
---

## Description
This runbook outphases multiple devices based on a comma-separated list of device IDs or serial numbers.
It can optionally wipe devices in Intune and delete or disable the corresponding Entra ID device objects.

## Location
Organization → Devices → Outphase Devices

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.PrivilegedOperations.All
  - DeviceManagementManagedDevices.ReadWrite.All
  - DeviceManagementServiceConfig.ReadWrite.All
  - Device.Read.All

### RBAC roles
- Cloud device administrator


## Parameters
### DeviceListChoice

Determines whether the list contains device IDs or serial numbers.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 0 |
| Type | Int32 |

### DeviceList

Comma-separated list of device IDs or serial numbers.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### intuneAction

Determines whether to wipe the device, delete it from Intune, or skip Intune actions.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |

### aadAction

Determines whether to delete the Entra ID device, disable it, or skip Entra ID actions.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |

### wipeDevice

Internal flag derived from intuneAction.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### removeIntuneDevice

Internal flag derived from intuneAction.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### removeAutopilotDevice

"Remove the device from Autopilot" (final value: true) or "Keep device in Autopilot" (final value: false) handles whether to delete the device from the Autopilot database.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### removeAADDevice

Internal flag derived from aadAction.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### disableAADDevice

Internal flag derived from aadAction.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

