---
title: Check Autopilot Serialnumbers
description: Check if given serial numbers are present in Autopilot
---

## Description
This runbook checks whether Windows Autopilot device identities exist for the provided serial numbers.
It returns the serial numbers found and lists any missing serial numbers.

## Location
Organization → General → Check Autopilot Serialnumbers

**Full Runbook name**

rjgit-org_general_check-autopilot-serialnumbers

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.Read.All
    - *Checks each serial number for an Autopilot identity via windowsAutopilotDeviceIdentities*


## Parameters
### SerialNumbers

Serial numbers of the devices, separated by commas.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Serial numbers of the devices (comma-separated) |



[Back to Runbook Reference overview](../../README.md)

