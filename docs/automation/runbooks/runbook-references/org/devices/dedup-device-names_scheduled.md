---
title: Dedup Device Names (Scheduled)
description: Rename Intune devices that share a display name
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Finds Intune devices that share the same display name and renames the most recently enrolled one of each set. The generated name is a fixed prefix followed by random digits up to the chosen total length. The new name is also written to the matching Windows Autopilot record. An OS filter limits which platforms are checked.

## Common use cases

- Schedule the runbook weekly to resolve duplicate device names that arise from re-enrollment, OS reimaging or cloning workflows automatically.
- The Autopilot sync path is idempotent, so unique devices are normalized in Autopilot as well, also on the first run.

## Parameter interactions

- `NameLength` must be strictly greater than the number of characters in `NamePrefix`. The difference determines how many random digits are appended; for example, `NamePrefix` "CORP" with `NameLength` 8 produces names like "CORP4271".
- The runbook validates this constraint at startup and fails fast when it is violated.

## Behaviour

Autopilot display name changes made via `updateDeviceProperties` take effect at the next device sync and may not be reflected in the portal immediately.


## Location
Organization → Devices → Dedup Device Names (Scheduled)

**Full Runbook name**

rjgit-org_devices_dedup-device-names_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.ReadWrite.All
    - *Lists all Intune managed devices and renames duplicates via setDeviceName*
  - DeviceManagementServiceConfig.ReadWrite.All
    - *Reads windowsAutopilotDeviceIdentities and syncs new names via updateDeviceProperties*
  - DeviceManagementManagedDevices.PrivilegedOperations.All
    - *Required for the privileged setDeviceName action when renaming duplicates*


## Parameters
### NamePrefix

Fixed start of every generated name, for example PC-.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Device name prefix |

### NameLength

Length of the generated name including the prefix; the rest is filled with random digits, so it must be longer than the prefix.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Total name length |

### OsFilter

Which platforms are checked: all, Windows only, macOS only, or the others (Android, iOS, ChromeOS).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
| Type | String |
| Portal display name | Operating system filter |

**Portal options**

| Portal option | Value |
| --- | --- |
| All platforms | All |
| Windows only | Windows |
| macOS only | MacOS |
| Other (Android, iOS, ChromeOS) | Other |



[Back to Runbook Reference overview](../../README.md)

