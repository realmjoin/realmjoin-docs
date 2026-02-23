---
title: Check Autopilot Serialnumbers
description: Check if given serial numbers are present in Autopilot
---

## Description
This runbook checks whether Windows Autopilot device identities exist for the provided serial numbers.
It returns the serial numbers found and lists any missing serial numbers.

## Location
Organization → General → Check Autopilot Serialnumbers

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.Read.All


## Parameters
### SerialNumbers

Serial numbers of the devices, separated by commas.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

