---
title: Sync All Devices
description: Sync all Intune devices.
---

## Description
This runbook triggers a sync operation for all Windows devices managed by Microsoft Intune.
It retrieves all managed Windows devices and sends a sync command to each device.
This is useful for forcing devices to check in with Intune and apply any pending policies or configurations.

## Location
Organization → General → Sync All Devices

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.ReadWrite.All


## Parameters


[Back to Runbook Reference overview](../../README.md)

