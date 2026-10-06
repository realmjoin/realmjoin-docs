---
title: Outphase Devices
description: Wipe and clean up several devices at once
---

## Description
Takes several devices out of service in one go, given as a list of device IDs or serial numbers. You choose whether the devices are wiped or only deleted from Intune, and whether their Autopilot registration is removed. Their Entra ID objects can be deleted, disabled or kept. Optionally the devices are tagged in Microsoft Defender for Endpoint so rules that use the tag can exclude them from automated remediation. A wipe removes all data and cannot be undone.

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

Whether the list holds Entra ID device IDs or serial numbers.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | List contains |

**Portal options**

| Portal option | Value |
| --- | --- |
| Device IDs | 0 |
| Serial numbers | 1 |

### DeviceList

Device IDs or serial numbers, separated by commas.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Device list |

### intuneAction

Completely wipe erases all user and enrollment data on the devices. Delete from Intune only removes the device records, for devices that are already wiped or destroyed. Do not wipe or remove leaves Intune untouched.

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
| Delete device from Intune | 1 |
| Do not wipe or remove device from Intune | 0 |

### aadAction

Delete removes the device objects from Entra ID, Disable keeps them but blocks sign-ins from the devices, and Keep leaves Entra ID untouched.

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

Legacy switch kept for compatibility. The choice under "Intune action" decides whether the devices are wiped.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### removeIntuneDevice

Legacy switch kept for compatibility. The choice under "Intune action" decides whether the Intune records are deleted.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### removeAutopilotDevice

Removing the devices from the Autopilot database lets them leave the tenant and be registered elsewhere. Keeping them allows a later redeployment in this tenant.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Delete from Autopilot database? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Remove the device from Autopilot | true |
| Keep device | false |

### removeAADDevice

Legacy switch kept for compatibility. The choice under "Entra ID object" decides whether the Entra ID objects are deleted.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### disableAADDevice

Legacy switch kept for compatibility. The choice under "Entra ID object" decides whether the Entra ID objects are disabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### excludeFromDefender

Tags the devices in Microsoft Defender for Endpoint with the exclusion tag so rules that use the tag can exclude them from automated remediation. Skip leaves Defender untouched.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Tag as excluded in Defender for Endpoint? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Tag devices as excluded in Defender for Endpoint | true |
| Skip Defender operations | false |

### defenderExclusionTag

Tag name written to the devices in Defender for Endpoint, for use in your exclusion rules.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | ExcludeFromRemediation |
| Type | String |
| Portal display name | Defender exclusion tag |



[Back to Runbook Reference overview](../../README.md)

