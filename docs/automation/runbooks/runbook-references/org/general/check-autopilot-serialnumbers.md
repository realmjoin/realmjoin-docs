---
title: Check Autopilot Serialnumbers
description: Check which serial numbers are registered in Autopilot
---

## Description
Checks for a list of serial numbers whether a Windows Autopilot registration exists and reports which were found and which are missing. Nothing is changed.

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

Serial numbers to check, separated by commas.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Serial numbers |



[Back to Runbook Reference overview](../../README.md)

