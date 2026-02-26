---
title: Check Device Onboarding Exclusion (Scheduled)
description: Add unenrolled Autopilot devices to an exclusion group
---

## Description
This runbook identifies Windows Autopilot devices that are not yet enrolled in Intune and ensures they are members of a configured exclusion group.
It also removes devices from the group once they are no longer in scope.

## Location
Organization → General → Check Device Onboarding Exclusion (Scheduled)

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All
  - Device.Read.All
  - DeviceManagementManagedDevices.Read.All


## Parameters
### exclusionGroupName

Display name of the exclusion group to manage.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Intune - Windows - Compliance for unenrolled Autopilot devices (devices) |
| Type | String |

### maxAgeInDays

Maximum age in days for recently enrolled devices to be considered in grace scope.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |



[Back to Runbook Reference overview](../../README.md)

