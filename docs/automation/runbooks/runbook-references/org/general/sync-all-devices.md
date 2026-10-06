---
title: Sync All Devices
description: Trigger an Intune sync on all Windows devices
---

## Description
Asks every Windows device managed by Intune to check in, so pending policies, apps and configuration are applied without waiting for the next regular check-in. Devices that are offline sync when they come back online.

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

