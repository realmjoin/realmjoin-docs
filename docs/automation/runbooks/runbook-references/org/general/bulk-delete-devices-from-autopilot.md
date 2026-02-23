---
title: Bulk Delete Devices From Autopilot
description: Bulk delete Autopilot objects by serial number
---

## Description
This runbook deletes Windows Autopilot device identities based on a comma-separated list of serial numbers.
It searches for each serial number and deletes the matching Autopilot object if found.

## Location
Organization → General → Bulk Delete Devices From Autopilot

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



[Back to Runbook Reference overview](../../README.md)

