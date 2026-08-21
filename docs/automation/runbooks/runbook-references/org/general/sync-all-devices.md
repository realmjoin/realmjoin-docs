---
title: Sync All Devices
description: Sync all Intune Windows devices
---

## Description
This runbook triggers a sync operation for all Windows devices managed by Microsoft Intune.
It forces devices to check in and apply pending policies and configurations.

## Location
Organization → General → Sync All Devices

**Full Runbook name**

rjgit-org_general_sync-all-devices

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.ReadWrite.All
    - *Lists all Windows devices via /deviceManagement/managedDevices to trigger the sync*
  - DeviceManagementManagedDevices.PrivilegedOperations.All
    - *Required for the syncDevice action triggered on every device*


## Parameters


[Back to Runbook Reference overview](../../README.md)

