---
title: Bulk Delete Devices From Autopilot
description: Bulk delete Autopilot objects by serial number
---

## Description
This runbook deletes Windows Autopilot device identities based on a comma-separated list of serial numbers.
It searches for each serial number and deletes the matching Autopilot object if found.

## Location
Organization → General → Bulk Delete Devices From Autopilot

**Full Runbook name**

rjgit-org_general_bulk-delete-devices-from-autopilot

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.ReadWrite.All


## Parameters
### SerialNumbers

Comma-separated list of serial numbers to delete from Autopilot.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Comma separated serial numbers |



[Back to Runbook Reference overview](../../README.md)

