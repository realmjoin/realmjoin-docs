---
title: Bulk Retire Devices From Intune
description: Bulk retire devices from Intune using serial numbers
---

## Description
Retires multiple Intune devices based on a comma-separated list of serial numbers. Each serial number is looked up in Intune and the device is retired if found.

## Location
Organization → General → Bulk Retire Devices From Intune

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.ReadWrite.All
  - Device.Read.All


## Parameters
### SerialNumbers

Comma-separated list of device serial numbers to retire.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

