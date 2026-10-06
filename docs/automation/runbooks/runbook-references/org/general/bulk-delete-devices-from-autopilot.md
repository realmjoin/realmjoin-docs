---
title: Bulk Delete Devices From Autopilot
description: Delete several Autopilot registrations by serial number
---

## Description
Removes the Windows Autopilot registrations of the devices with the given serial numbers, for example before a device is handed to another tenant or disposed of. Serial numbers that are not found are reported and skipped.

## Location
Organization → General → Bulk Delete Devices From Autopilot

**Full Runbook name**

rjgit-org_general_bulk-delete-devices-from-autopilot

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.ReadWrite.All
    - *Searches Autopilot identities by serial number and deletes them*


## Parameters
### SerialNumbers

Serial numbers of the devices to remove, separated by commas.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Serial numbers |



[Back to Runbook Reference overview](../../README.md)

