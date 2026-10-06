---
title: Wipe Managed App Data
description: Remove company app data from this MAM-managed device
---

## Description
Removes company data from apps protected by app protection policies on this device, without wiping the whole device. This is the app selective wipe known from the Intune portal, typically used for lost or stolen devices that are managed by app protection only and not enrolled in Intune. The data is removed the next time each protected app checks in, so the wipe is not instant. Pending requests can be monitored and cancelled in the Intune portal.

## Device matching

MAM app registrations belong to a user, not to a device object. The runbook therefore resolves the
users registered on the device and matches their app registrations against the device's EntraID
device id (`azureADDeviceId`). Registrations without an EntraID device id are matched by the
device's display name as fallback; the runbook output indicates when this fallback was used.

## Wipe behavior

- The company app data is removed the next time each protected app checks in on the device; the
  wipe is not instantaneous.
- Pending wipe requests can be monitored and cancelled in the Intune portal under
  *Apps > App selective wipe*.
- Only app data protected by app protection policies (MAM) is affected. The device object itself
  is not touched: it remains in EntraID (and in Intune/Autopilot, if it is additionally
  MDM-enrolled). To disable or remove the device there as well, run the **Outphase Device**
  runbook (Device \ General) afterwards; for a full wipe of MDM-enrolled devices use
  **Wipe Device**.


## Location
Device → General → Wipe Managed App Data

**Full Runbook name**

rjgit-device_general_wipe-managed-app-data

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementApps.ReadWrite.All
    - *Reads the user's managedAppRegistrations and creates MAM wipes via wipeManagedAppRegistrationsByDeviceTag*
  - Device.Read.All
    - *Resolves the target device via /devices and lists its registered users and owners*
  - User.Read.All
    - *Reads the registered users' id and UPN to build the per-user MAM registration queries*

### RBAC roles
- Intune Administrator
  - *Grants Intune RBAC for reading managedAppRegistrations and posting the app-only MAM wipe*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

