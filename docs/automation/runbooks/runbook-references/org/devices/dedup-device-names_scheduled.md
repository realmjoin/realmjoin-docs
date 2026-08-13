---
title: Dedup Device Names (Scheduled)
description: Detect and rename duplicate Intune device display names using a prefix and random suffix
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
This scheduled runbook queries all Intune managed devices and identifies devices that share the same display name.
For each set of duplicates, the most recently enrolled device is renamed to a generated name consisting of a configurable prefix followed by random digits padded to the specified total length, and that name is persisted in the matching Windows Autopilot device object.
An optional OS filter restricts processing to a specific platform (Windows, macOS, or other); when set to All, devices of every platform are evaluated.

## Location
Organization → Devices → Dedup Device Names (Scheduled)

**Full Runbook name**

rjgit-org_devices_dedup-device-names_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | yes |

## Notes
Prerequisites:
- The managed identity must have DeviceManagementManagedDevices.ReadWrite.All and DeviceManagementServiceConfig.ReadWrite.All Graph application permissions assigned.
- Autopilot display name changes via updateDeviceProperties take effect at the next device sync and may not reflect immediately in the portal.

Parameter Interactions:
- NameLength must be strictly greater than the character count of NamePrefix. The difference determines how many random digits are appended (e.g., NamePrefix "CORP" with NameLength 8 produces names like "CORP4271").
- The runbook validates this constraint at startup and fails fast if violated.

Common Use Cases:
- Schedule weekly to automatically resolve duplicate device names that arise from re-enrollment, OS reimaging, or cloning workflows.
- The idempotent Autopilot sync path ensures that unique devices are also normalized in Autopilot even on the first run.

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.ReadWrite.All
  - DeviceManagementServiceConfig.ReadWrite.All


## Parameters
### NamePrefix

The fixed prefix used at the start of every generated device name. All renamed devices will begin with this string.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Device Name Prefix |

### NameLength

The total character length of the generated device name, including the prefix. Must be greater than the length of NamePrefix so there is room for the random digit suffix.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Total Name Length (including prefix) |

### OsFilter

Restricts which devices are evaluated for duplicate detection and renaming. All includes every platform; Windows and MacOS process only those platforms; Other covers Android, iOS, ChromeOS, and any unrecognized OS. Defaults to All.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
| Type | String |
| Portal display name | Operating System Filter |

**Portal options**

| Portal option | Value |
| --- | --- |
| All Platforms |  |
| Windows only |  |
| macOS only |  |
| Other (Android, iOS, ChromeOS) |  |



[Back to Runbook Reference overview](../../README.md)

