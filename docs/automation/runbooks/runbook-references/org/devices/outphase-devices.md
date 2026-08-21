---
title: Outphase Devices
description: Remove or outphase multiple devices
---

## Description
This runbook outphases multiple devices based on a comma-separated list of device IDs or serial numbers.
It can optionally wipe devices in Intune and delete or disable the corresponding Entra ID device objects.
Optionally, each device can be tagged in Microsoft Defender for Endpoint to mark it as excluded from remediation.
NOTE: The Exclusion Tag is applied to the device, but it only appears in the Defender portal's "Tags" filter once it has been created once via the portal (Device > Manage tags > "Create new tag").

## Microsoft Defender for Endpoint exclusion tag

Microsoft Defender for Endpoint has a native **Exclusion state** (shown in the Device Inventory filter as *Excluded* / *Not Excluded*). This state can only be set through the Defender portal — there is **no API** to set a device's native exclusion state programmatically.

Because the native exclusion state cannot be automated, this runbook instead applies a custom device tag (default `ExcludeFromRemediation`) when *Exclude devices from Defender for Endpoint* is enabled. Each device in the list is looked up by its Entra ID device ID and tagged via `POST /api/machines/{id}/tags`, providing a marker that can be used to filter and target excluded devices.

### One-time setup: make the tag filterable

The portal's **Tags** filter only lists tags that were created through the portal. A tag set purely via the API is attached to the device and visible on the device page, but it does **not** appear in the Tags filter on its own.

To make the exclusion tag visible and usable for filtering in the [Defender Device Inventory](https://security.microsoft.com/machines), one client must be tagged manually once through the portal (select a device > **Manage tags** > "Create new tag", using the exact same tag value). After this one-time step the tag becomes a known, filterable tag, and this runbook can apply it to devices at scale.

> **Note:** This tag is only a label — it does not set the device's native Exclusion state and has no remediation effect on its own. It takes effect only if a Defender device group or automation rule is explicitly configured to match this tag value. Such rules match the tag value directly, independently of the portal **Tags** filter, so the one-time manual step only affects whether the tag is selectable for filtering in the portal UI.

Devices supplied by serial number that are not found in Intune have no Entra ID device ID and are therefore not tagged in Defender.

See [Create and manage device tags](https://learn.microsoft.com/defender-endpoint/machine-tags#create-tags) for details.


## Location
Organization → Devices → Outphase Devices

**Full Runbook name**

rjgit-org_devices_outphase-devices

## Details

| Property | Value |
| --- | --- |
| Version | 1.2.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.PrivilegedOperations.All
    - *Triggers the device wipe via managedDevices/{id}/wipe when the wipe action is selected*
  - DeviceManagementManagedDevices.ReadWrite.All
    - *Looks up Intune devices by serial number or azureADDeviceId and deletes them*
  - DeviceManagementServiceConfig.ReadWrite.All
    - *Finds and deletes the device's Autopilot record*
  - Device.Read.All
    - *Looks up the Entra device object and its registered owner for the report*
- **Type**: WindowsDefenderATP
  - Machine.Read.All
    - *Finds the device in Defender for Endpoint via /machines filtered by aadDeviceId*
  - Machine.ReadWrite.All
    - *Adds the exclusion tag via /machines/{id}/tags when excludeFromDefender is enabled*

### RBAC roles
- Cloud Device Administrator
  - *Required to disable and delete Entra device objects via /devices/{id}*


## Parameters
### DeviceListChoice

Determines whether the list contains device IDs or serial numbers.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Select list type |

**Portal options**

| Portal option | Value |
| --- | --- |
| Comma separated list by Device IDs | 0 |
| Comma separated list by Serial Numbers | 1 |

### DeviceList

Comma-separated list of device IDs or serial numbers.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Comma separated list |

### intuneAction

Determines whether to wipe the device, delete it from Intune, or skip Intune actions.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |
| Portal display name | Wipe this device? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Completely wipe device (not keeping user or enrollment data) | 2 |
| Delete device from Intune | 1 |
| Do not wipe or remove device from Intune | 0 |

### aadAction

Determines whether to delete the Entra ID device, disable it, or skip Entra ID actions.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |
| Portal display name | Delete device from Entra ID? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Delete device in Entra ID | 2 |
| Disable device in Entra ID | 1 |
| Do not delete or disable Entra ID device | 0 |

### wipeDevice

Internal flag derived from intuneAction.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### removeIntuneDevice

Internal flag derived from intuneAction.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### removeAutopilotDevice

"Remove the device from Autopilot" (final value: true) or "Keep device in Autopilot" (final value: false) handles whether to delete the device from the Autopilot database.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Delete device from Autopilot database |

**Portal options**

| Portal option | Value |
| --- | --- |
| Remove the device from Autopilot | true |
| Keep device | false |

### removeAADDevice

Internal flag derived from aadAction.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### disableAADDevice

Internal flag derived from aadAction.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### excludeFromDefender

If set to true, each device will be tagged in Microsoft Defender for Endpoint with the specified exclusion tag. If set to false, the Defender step will be skipped entirely.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Exclude devices from Defender for Endpoint? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Tag devices as excluded in Defender for Endpoint | true |
| Skip Defender operations | false |

### defenderExclusionTag

The tag that will be added to the device in Microsoft Defender for Endpoint to mark it as excluded. Defaults to "ExcludeFromRemediation".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | ExcludeFromRemediation |
| Type | String |
| Portal display name | Defender Exclusion Tag |



[Back to Runbook Reference overview](../../README.md)

