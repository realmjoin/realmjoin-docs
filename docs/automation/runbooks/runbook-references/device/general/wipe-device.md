---
title: Wipe Device
description: Wipe this Windows or macOS device and clean up its records
---

## Description
Wipes this Windows or macOS device. Optionally it also cleans up what is left of it: the Intune record, the Autopilot registration and the Entra ID object can be deleted or disabled. For Windows you can choose a protected wipe and a longer compliance grace period after re-enrollment, for macOS a recovery code and how the OS is erased. A wipe removes all data on the device and cannot be undone. The wipe can be skipped when Defender for Endpoint rates the device as medium or high risk.

## Only wipe if the device is not at risk

When *Only wipe if device is not at risk* (`skipWipeIfAtRisk`) is enabled, the runbook checks the device's risk score in Microsoft Defender for Endpoint before any device object is touched. The lookup uses the Entra device ID and is the same query the **Check Defender Status** runbook performs. The check is off by default and only runs when a wipe is requested; it is skipped when *Do not wipe device* is selected.

Possible outcomes:

- **No elevated risk** (risk score `None`, `Informational` or `Low`): the wipe and the selected clean-up actions run as usual.
- **Risk score `Medium` or `High`**: the runbook stops with a warning before the wipe, the exclusion-group membership, the Entra changes and the Intune/Autopilot deletions. A device with an elevated risk score may be involved in a security incident, and wiping it could destroy forensic data (e.g. logs). Align with your security team first; to wipe the device anyway, run the runbook with the option disabled.
- **Device not found in Defender for Endpoint**: the risk score cannot be determined. The runbook notes this and proceeds with the wipe, so devices that are not onboarded to Defender are not blocked.
- **Defender query fails**: the runbook stops without wiping, so a temporary API problem never bypasses the protection.

### Enable the check by default

To enforce the check for every wipe, preset the parameter and hide it, so it cannot be switched off from the portal.

The json configuration for this is as follows:

```json
"rjgit-device_general_wipe-device": {
    "parameters": {
        "skipWipeIfAtRisk": {
            "Default": true,
            "Hide": true
        }
    }
}
```

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

## macOS wipe options

macOS devices are wiped through Intune's erase action. Two options only apply to them:

- **Recovery code (macOS)** (`macOsRecoveryCode`): older Macs need a six-digit recovery code to accept the wipe; newer devices ignore it. The parameter is hidden in the portal and can be preset via runbook customization.
- **Obliteration behavior (macOS)** (`macOsObliterationBehavior`): decides what happens when *Erase All Content and Settings* (EACS) is not possible. `default` erases the user data and falls back to erasing the whole OS, `doNotObliterate` never erases the OS, `obliterateWithWarning` warns and then erases the OS, `always` erases the OS in any case.

Windows-only options (*protected wipe*, *Autopilot database*, *compliance exclusion group*) are ignored for macOS devices.


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
  - Machine.Read.All *(optional — feature: Defender risk check)*
    - *Reads the device's Defender risk score in the skipWipeIfAtRisk preflight*

### RBAC roles
- Cloud Device Administrator
  - *Required to disable and delete the Entra device object via /devices/{id}*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### wipeDevice

Completely wipe erases all user and enrollment data on the device. Do not wipe leaves the device untouched and only runs the selected cleanup steps.

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

Keeps trying to wipe even if the device is switched off in between, so the wipe cannot be dodged by powering off. Windows only.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Use protected wipe (Windows)? |

### removeIntuneDevice

Deletes the device record in Intune. Only sensible when the device is already wiped or destroyed.

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
| Keep the Intune record | false |

### removeAutopilotDevice

Removing the device from the Autopilot database lets it leave the tenant and be registered elsewhere. Keeping it allows a later redeployment in this tenant. Windows only.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Delete from Autopilot database (Windows)? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Remove from Autopilot (the device can leave the tenant) | true |
| Keep the device in Autopilot | false |

### removeAADDevice

Whether the Entra ID device object is deleted after the wipe. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### disableAADDevice

Disabling blocks sign-ins from the device but keeps its object in Entra ID. Keep leaves the Entra ID object unchanged.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Disable Entra ID device object? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Disable device in Entra ID | true |
| Keep the Entra ID device unchanged | false |

### skipWipeIfAtRisk

Skips the wipe when Microsoft Defender for Endpoint rates the device as medium or high risk. That keeps evidence intact on a device that may be part of a security incident.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Only wipe if the device is not at risk? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Only wipe if the Defender risk score is not medium or high | true |
| Wipe regardless of the Defender risk score | false |

### addToExclusionGroup

Adds the device to the compliance exclusion group so it gets a longer compliance grace period when it is re-enrolled through Autopilot. Windows only.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Add to compliance exclusion group (Windows)? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add device to the compliance exclusion group | true |
| Do not add to the exclusion group | false |

### exclusionGroupName

Display name of the exclusion group the device is added to. An object ID preset in the runbook customization takes precedence.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Intune - Windows - Compliance for unenrolled Autopilot devices (devices) |
| Type | String |
| Portal display name | Compliance exclusion group name |

### exclusionGroupId

Object ID of the exclusion group. Preset in the runbook customization and used instead of the group name to avoid name clashes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Compliance exclusion group object ID |
| Hidden in portal | yes (preset via runbook customization) |

### macOsRecoveryCode

Recovery code for older Macs that need one to be wiped. Newer devices ignore it. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 123456 |
| Type | String |
| Portal display name | Recovery code (macOS) |
| Hidden in portal | yes (preset via runbook customization) |

### macOsObliterationBehavior

How a Mac is erased: erase user data first and fall back to erasing the OS, never erase the OS, warn before erasing the OS, or always erase the OS.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | default |
| Type | String |
| Portal display name | Obliteration behavior (macOS) |

**Portal options**

| Portal option | Value |
| --- | --- |
| Erase user data (EACS), erase the OS if that fails | default |
| Erase user data (EACS), never erase the OS | doNotObliterate |
| Erase user data (EACS), else warn and erase the OS | obliterateWithWarning |
| Always erase the OS | always |



[Back to Runbook Reference overview](../../README.md)

