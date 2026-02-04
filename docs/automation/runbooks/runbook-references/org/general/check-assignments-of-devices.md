---
title: Check Assignments Of Devices
description: Check Intune assignments for a given (or multiple) Device Names.
---

## Description
This script checks the Intune assignments for a single or multiple specified Device Names.

## Location
Organization → General → Check Assignments Of Devices

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
  - Group.Read.All
  - DeviceManagementConfiguration.Read.All
  - DeviceManagementManagedDevices.Read.All
  - DeviceManagementApps.Read.All


## Parameters
### DeviceNames

Device Names of the devices to check assignments for, separated by commas.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### IncludeApps

Boolean to specify whether to include application assignments in the search.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |


[Back to Table of Content](../../README.md)

