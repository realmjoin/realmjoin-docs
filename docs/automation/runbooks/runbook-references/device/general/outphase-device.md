---
title: Outphase Device
description: Wipe this Windows device and clean up Intune, Autopilot and Entra ID
---

## Description
Takes this Windows device out of service. You choose whether the device is wiped or only deleted from Intune, and whether it leaves the Autopilot database. Its Entra ID object can be deleted, disabled or kept. Optionally the device is tagged in Microsoft Defender for Endpoint so rules that use the tag can exclude it from automated remediation. A wipe removes all user and enrollment data from the device and cannot be undone.

## Microsoft Defender for Endpoint exclusion tag

Microsoft Defender for Endpoint has a native **Exclusion state** (shown in the Device Inventory filter as *Excluded* / *Not Excluded*). This state can only be set through the Defender portal — there is **no API** to set a device's native exclusion state programmatically.

Because the native exclusion state cannot be automated, this runbook instead applies a custom device tag (default `ExcludeFromRemediation`) when *Exclude device from Defender for Endpoint* is enabled. The device is looked up by its Entra ID device ID and tagged via `POST /api/machines/{id}/tags`, providing a marker that can be used to filter and target excluded devices.

### One-time setup: make the tag filterable

The portal's **Tags** filter unfortunately only lists tags that were created through the portal. A tag set purely via the API is attached to the device and visible on the device page, but it does **not** appear in the Tags filter on its own.

To make the exclusion tag visible and usable for filtering in the [Defender Device Inventory](https://security.microsoft.com/machines), one client must be tagged manually once through the portal (select a device > **Manage tags** > "Create new tag", using the exact same tag value). After this one-time step the tag becomes a known, filterable tag, and this runbook can apply it to devices at scale.

> **Note:** This tag is only a label — it does not set the device's native Exclusion state and has no remediation effect on its own. It takes effect only if a Defender device group or automation rule is explicitly configured to match this tag value. Such rules match the tag value directly, independently of the portal **Tags** filter, so the one-time manual step only affects whether the tag is selectable for filtering in the portal UI.

See [Create and manage device tags](https://learn.microsoft.com/defender-endpoint/machine-tags#create-tags) for details.


## Location
Device → General → Outphase Device

**Full Runbook name**

rjgit-device_general_outphase-device

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.PrivilegedOperations.All
    - *Triggers the Intune wipe action when the wipe option is selected*
  - DeviceManagementManagedDevices.ReadWrite.All
    - *Finds the Intune device by azureADDeviceId and deletes it when removeIntuneDevice is set*
  - DeviceManagementServiceConfig.ReadWrite.All
    - *Finds and deletes the Autopilot identity when removeAutopilotDevice is set*
  - Device.Read.All
    - *Resolves the Entra device and reads its registered owners for the status output*
- **Type**: WindowsDefenderATP
  - Machine.Read.All
    - *Looks up the device in Defender for Endpoint when excludeFromDefender is enabled*
  - Machine.ReadWrite.All
    - *Adds the exclusion tag via /machines/{id}/tags when excludeFromDefender is enabled*

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

### intuneAction

Completely wipe erases all user and enrollment data on the device. Delete from Intune only removes the device record, for devices that are already wiped or destroyed. Do not wipe or remove leaves Intune untouched.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |
| Portal display name | Intune action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Completely wipe device (not keeping user or enrollment data) | 2 |
| Delete device from Intune (only if device is already wiped or destroyed) | 1 |
| Do not wipe or remove device from Intune | 0 |

### aadAction

Delete removes the device object from Entra ID, Disable keeps it but blocks sign-ins from the device, and Keep leaves Entra ID untouched.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |
| Portal display name | Entra ID object |

**Portal options**

| Portal option | Value |
| --- | --- |
| Delete device in Entra ID | 2 |
| Disable device in Entra ID | 1 |
| Keep the Entra ID device | 0 |

### wipeDevice

Legacy switch kept for compatibility. The choice under "Intune action" decides whether the device is wiped.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### removeIntuneDevice

Legacy switch kept for compatibility. The choice under "Intune action" decides whether the Intune record is deleted.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### removeAutopilotDevice

Removing the device from the Autopilot database lets it leave the tenant and be registered elsewhere. Keeping it allows a later redeployment in this tenant.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Delete device from Autopilot database? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Remove from Autopilot (the device can leave the tenant) | true |
| Keep the device in Autopilot | false |

### removeAADDevice

Legacy switch kept for compatibility. The choice under "Entra ID object" decides whether the Entra ID object is deleted.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### disableAADDevice

Legacy switch kept for compatibility. The choice under "Entra ID object" decides whether the Entra ID object is disabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### excludeFromDefender

Tags the device in Microsoft Defender for Endpoint with the exclusion tag so rules that use the tag can exclude it from automated remediation. Skip leaves Defender untouched.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Tag as excluded in Defender for Endpoint? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Tag device as excluded in Defender for Endpoint | true |
| Skip Defender operations | false |

### defenderExclusionTag

Tag name written to the device in Defender for Endpoint, for use in your exclusion rules.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | ExcludeFromRemediation |
| Type | String |
| Portal display name | Defender exclusion tag |



[Back to Runbook Reference overview](../../README.md)

