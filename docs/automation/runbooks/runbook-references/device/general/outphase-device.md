---
title: Outphase Device
description: Remove/Outphase a windows device
---

## Description
Remove/Outphase a windows device. You can choose if you want to wipe the device and/or delete it from Intune an AutoPilot.

## Location
Device → General → Outphase Device

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
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### intuneAction

Determines the Intune action to perform (wipe, delete, or none).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |

### aadAction

Determines the Entra ID (Azure AD) action to perform (delete, disable, or none).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |

### wipeDevice

If set to true, triggers a wipe action in Intune.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### removeIntuneDevice

If set to true, deletes the Intune device object.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### removeAutopilotDevice

"Delete device from AutoPilot database?" (final value: true) or "Keep device / do not care" (final value: false) can be selected as action to perform. If set to true, the runbook will delete the device from the AutoPilot database, which also allows the device to leave the tenant. If set to false, the device will remain in the AutoPilot database and can be re-assigned to another user/device in the tenant.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### removeAADDevice

"Delete device from EntraID?" (final value: true) or "Keep device / do not care" (final value: false) can be selected as action to perform. If set to true, the runbook will delete the device object from Entra ID (Azure AD). If set to false, the device object will remain in Entra ID (Azure AD).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### disableAADDevice

"Disable device in EntraID?" (final value: true) or "Keep device / do not care" (final value: false) can be selected as action to perform. If set to true, the runbook will disable the device object in Entra ID (Azure AD). If set to false, the device object will remain enabled in Entra ID (Azure AD).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

