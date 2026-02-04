---
title: Delete Stale Devices (Scheduled)
description: Scheduled deletion of stale devices based on last activity date and platform.
---

## Description
Identifies, lists, and deletes devices that haven't been active for a specified number of days.
Can be scheduled to run automatically and send a report via email.

## Location
Organization → Devices → Delete Stale Devices_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
  - DeviceManagementManagedDevices.DeleteAll
  - Directory.Read.All
  - Device.Read.All
  - Mail.Send


## Parameters
### Days

Number of days without activity to be considered stale.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |

### Windows

Include Windows devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### MacOS

Include macOS devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### iOS

Include iOS devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### Android

Include Android devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### DeleteDevices

If set to true, the script will delete the stale devices. If false, it will only report them.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ConfirmDeletion

If set to true, the script will prompt for confirmation before deleting devices.
Should be set to false for scheduled runs.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### sendAlertTo

Email address to send the report to.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja.com |
| Type | String |

### sendAlertFrom

Email address to send the report from.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbook@glueckkanja.com |
| Type | String |


[Back to Table of Content](../../README.md)

