---
title: Wipe Device
description: Wipe a Windows or MacOS device
---

## Description
Wipe a Windows or MacOS device. For Windows devices, you can choose between a regular wipe and a protected wipe. For MacOS devices, you can provide a recovery code if needed and specify the obliteration behavior.

## Add the device to a compliance exclusion group

When *Add device to compliance exclusion group* (`addToExclusionGroup`) is enabled, the wiped Windows device is added to a compliance exclusion group. Devices in that group receive a longer compliance grace period after they are re-enrolled via Autopilot (this mirrors the **Check Device Onboarding Exclusion** runbook).

By default the group is identified by its **display name** (`exclusionGroupName`). Because display names are not guaranteed to be unique, you can instead pin the group by its **Object ID** (`exclusionGroupId`). When an Object ID is provided, it **always overrides** the display name, so name conflicts can never lead to the wrong group being used. `exclusionGroupId` is hidden by default and is meant to be set via runbook customization.

The group is resolved and validated in an upfront preflight check. If the configured group does not exist, the runbook aborts **before** any wipe/delete/disable action, so no half-applied state is left behind. Adding to the group is skipped for non-Windows devices and when the device is deleted from EntraID (`removeAADDevice`).

### Pin the group by Object ID (recommended)

Preset the group's Object ID and enable the switch, keeping the fields hidden. This avoids any ambiguity from duplicate display names.

The json configuration for this is as follows:

```json
"rjgit-device_general_wipe-device": {
    "parameters": {
        "addToExclusionGroup": {
            "Default": true
        },
        "exclusionGroupId": {
            "Default": "00000000-0000-0000-0000-000000000000",
            "Hide": true
        },
        "exclusionGroupName": {
            "Hide": true
        }
    }
}
```

Replace `00000000-0000-0000-0000-000000000000` with the Object ID of your group (EntraID > Groups > *your group* > **Object Id**).

### Pin the group by display name

If you prefer to work with the display name (and it is unique in your tenant), preset `exclusionGroupName` and leave `exclusionGroupId` empty so the name is used.

The json configuration for this is as follows:

```json
"rjgit-device_general_wipe-device": {
    "parameters": {
        "addToExclusionGroup": {
            "Default": true
        },
        "exclusionGroupName": {
            "Default": "cfg - Intune - Windows - Compliance for unenrolled Autopilot devices (devices)",
            "Hide": true
        }
    }
}
```


## Location
Device → General → Wipe Device

**Full Runbook name**

rjgit-device_general_wipe-device

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.PrivilegedOperations.All
    - *Triggers the Intune wipe action when wipeDevice is selected*
  - DeviceManagementManagedDevices.ReadWrite.All
    - *Finds the Intune device by azureADDeviceId and deletes it when removeIntuneDevice is set*
  - DeviceManagementServiceConfig.ReadWrite.All
    - *Finds and deletes the Autopilot identity when removeAutopilotDevice is set*
  - Device.Read.All
    - *Resolves the Entra device and reads its registered owners for the report*
  - GroupMember.ReadWrite.All
    - *Adds the device to the exclusion group when addToExclusionGroup is enabled*
- **Type**: WindowsDefenderATP
  - Machine.Read.All
    - *Reads the device's Defender risk score in the skipWipeIfAtRisk preflight*

### RBAC roles
- Cloud Device Administrator
  - *Required to disable and delete the Entra device object via /devices/{id}*


## Parameters
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### wipeDevice

"Wipe this device?" (final value: true) or "Do not wipe device" (final value: false) can be selected as action to perform. If set to true, the runbook will trigger a wipe action for the device in Intune. If set to false, no wipe action will be triggered for the device in Intune.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Wipe this device? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Completely wipe device (Windows: not keeping user or enrollment data) | true |
| Do not wipe device | false |

### useProtectedWipe

Windows-only. If set to true, uses protected wipe.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Windows: Use protected wipe? |

### removeIntuneDevice

If set to true, deletes the Intune device object.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Delete device from Intune? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Delete device from Intune (only if device is already wiped or destroyed) | true |
| Do not modify the Intune object / do not care | false |

### removeAutopilotDevice

Windows-only. "Delete device from AutoPilot database?" (final value: true) or "Keep device / do not care" (final value: false) can be selected as action to perform. If set to true, the runbook will delete the device from the AutoPilot database, which also allows the device to leave the tenant. If set to false, the device will remain in the AutoPilot database and can be re-assigned to another user/device in the tenant.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Windows: Delete device from AutoPilot database? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Remove the device from AutoPilot (the device can leave the tenant) | true |
| Keep device / do not care | false |

### removeAADDevice

"Delete device from EntraID?" (final value: true) or "Keep device / do not care" (final value: false) can be selected as action to perform. If set to true, the runbook will delete the device object from Entra ID (Azure AD). If set to false, the device object will remain in Entra ID (Azure AD).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### disableAADDevice

"Disable device in EntraID?" (final value: true) or "Keep device / do not care" (final value: false) can be selected as action to perform. If set to true, the runbook will disable the device object in Entra ID (Azure AD). If set to false, the device object will remain enabled in Entra ID (Azure AD).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Disable AzureAD device object? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Disable device in AzureAD | true |
| Do not modify AzureAD device / do not care | false |

### skipWipeIfAtRisk

If set to true, the wipe is only performed when the device's Microsoft Defender for Endpoint risk score is not Medium or High. This protects forensic data (e.g. logs) of devices that may be involved in a security incident from being destroyed by the wipe.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Only wipe if device is not at risk (Defender Medium/High)? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Only wipe if Defender risk score is not Medium/High | true |
| Wipe regardless of Defender risk score | false |

### addToExclusionGroup

Windows-only. If set to true, the device is added to the compliance exclusion group referenced by 'exclusionGroupName'. This grants the device a longer compliance grace period after it is re-enrolled via Autopilot (see the 'Check Device Onboarding Exclusion' runbook).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Windows: Add device to compliance exclusion group (longer grace period)? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add device to the compliance exclusion group | true |
| Do not add to exclusion group / do not care | false |

### exclusionGroupName

Display name of the compliance exclusion group the device should be added to when 'addToExclusionGroup' is enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Intune - Windows - Compliance for unenrolled Autopilot devices (devices) |
| Type | String |
| Portal display name | Compliance exclusion group name |

### exclusionGroupId

Object ID of the compliance exclusion group. If provided, it always overrides 'exclusionGroupName' (avoids name conflicts). Hidden by default; intended to be set via Runbook Customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Compliance exclusion group Object ID (overrides name) |
| Hidden in portal | yes (preset via runbook customization) |

### macOsRecoveryCode

MacOS-only. Recovery code for older devices; newer devices may not require this.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 123456 |
| Type | String |
| Portal display name | MacOS: Recovery Code - not needed for newer devices |
| Hidden in portal | yes (preset via runbook customization) |

### macOsObliterationBehavior

MacOS-only. Controls the OS obliteration behavior during wipe.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | default |
| Type | String |
| Portal display name | MacOS: OS Obliteration Behavior |

**Portal options**

| Portal option | Value |
| --- | --- |
| Default: Try to erase user date (EACS), obliterate OS if this fails | default |
| Try to erase user data (EACS), do not obliterate the OS | doNotObliterate |
| Try to erase user data (EACS), else warn and obliterate the OS | obliterateWithWarning |
| Always obliterate OS | always |



[Back to Runbook Reference overview](../../README.md)

