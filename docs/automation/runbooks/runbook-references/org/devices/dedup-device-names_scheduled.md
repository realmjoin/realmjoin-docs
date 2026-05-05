---
title: Dedup Device Names (Scheduled)
description: Detect and rename duplicate Intune device display names using a prefix and random suffix
---

## Description
This scheduled runbook queries all Intune managed devices and identifies devices that share the same display name.
For each set of duplicates, the most recently enrolled device is renamed to a generated name consisting of a configurable prefix followed by random digits padded to the specified total length, and that name is persisted in the matching Windows Autopilot device object.
An optional OS filter restricts processing to a specific platform (Windows, macOS, or other); when set to All, devices of every platform are evaluated.

## Location
Organization → Devices → Dedup Device Names (Scheduled)

**Full Runbook name**

rjgit-org_devices_dedup-device-names_scheduled

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

### NameLength

The total character length of the generated device name, including the prefix. Must be greater than the length of NamePrefix so there is room for the random digit suffix.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 0 |
| Type | Int32 |

### OsFilter

Restricts which devices are evaluated for duplicate detection and renaming. All includes every platform; Windows and MacOS process only those platforms; Other covers Android, iOS, ChromeOS, and any unrecognized OS. Defaults to All.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

