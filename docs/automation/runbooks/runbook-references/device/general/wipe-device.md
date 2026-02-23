---
title: Wipe Device
description: Wipe a Windows or MacOS device
---

## Description
Wipe a Windows or MacOS device. For Windows devices, you can choose between a regular wipe and a protected wipe. For MacOS devices, you can provide a recovery code if needed and specify the obliteration behavior.

## Location
Device → General → Wipe Device

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

### wipeDevice

"Wipe this device?" (final value: true) or "Do not wipe device" (final value: false) can be selected as action to perform. If set to true, the runbook will trigger a wipe action for the device in Intune. If set to false, no wipe action will be triggered for the device in Intune.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### useProtectedWipe

Windows-only. If set to true, uses protected wipe.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### removeIntuneDevice

If set to true, deletes the Intune device object.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### removeAutopilotDevice

Windows-only. "Delete device from AutoPilot database?" (final value: true) or "Keep device / do not care" (final value: false) can be selected as action to perform. If set to true, the runbook will delete the device from the AutoPilot database, which also allows the device to leave the tenant. If set to false, the device will remain in the AutoPilot database and can be re-assigned to another user/device in the tenant.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### removeAADDevice

"Delete device from EntraID?" (final value: true) or "Keep device / do not care" (final value: false) can be selected as action to perform. If set to true, the runbook will delete the device object from Entra ID (Azure AD). If set to false, the device object will remain in Entra ID (Azure AD).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### disableAADDevice

"Disable device in EntraID?" (final value: true) or "Keep device / do not care" (final value: false) can be selected as action to perform. If set to true, the runbook will disable the device object in Entra ID (Azure AD). If set to false, the device object will remain enabled in Entra ID (Azure AD).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### macOsRecoveryCode

MacOS-only. Recovery code for older devices; newer devices may not require this.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 123456 |
| Type | String |

### macOsObliterationBehavior

MacOS-only. Controls the OS obliteration behavior during wipe.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | default |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

