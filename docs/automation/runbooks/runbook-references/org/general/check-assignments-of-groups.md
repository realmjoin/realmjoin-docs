---
title: Check Assignments Of Groups
description: Check Intune assignments for a given (or multiple) Group Names.
---

## Description
This script checks the Intune assignments for a single or multiple specified Group Names.

## Location
Organization → General → Check Assignments Of Groups

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - Group.Read.All
  - DeviceManagementConfiguration.Read.All
  - DeviceManagementManagedDevices.Read.All
  - Device.Read.All


## Parameters
### GroupNames

Group Names of the groups to check assignments for, separated by commas.

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

