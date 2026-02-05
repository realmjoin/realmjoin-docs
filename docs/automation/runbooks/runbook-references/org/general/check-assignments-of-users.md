---
title: Check Assignments Of Users
description: Check Intune assignments for a given (or multiple) User Principal Names (UPNs).
---

## Description
This script checks the Intune assignments for a single or multiple specified UPNs.

## Location
Organization → General → Check Assignments Of Users

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - Group.Read.All
  - DeviceManagementConfiguration.Read.All
  - DeviceManagementManagedDevices.Read.All
  - Device.Read.All


## Parameters
### UPN

User Principal Names of the users to check assignments for, separated by commas.

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



[Back to Runbook Reference overview](../../README.md)

