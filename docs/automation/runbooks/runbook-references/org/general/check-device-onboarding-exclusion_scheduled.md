---
title: Check Device Onboarding Exclusion (Scheduled)
description: Check for Autopilot devices not yet onboarded to Intune. Add these to an exclusion group.
---

## Description
Check for Autopilot devices not yet onboarded to Intune. Add these to an exclusion group.

## Location
Organization → General → Check Device Onboarding Exclusion_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All
  - Device.Read.All
  - DeviceManagementManagedDevices.Read.All


## Parameters
### exclusionGroupName

EntraID exclusion group for Defender Compliance.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Intune - Windows - Compliance for unenrolled Autopilot devices (devices) |
| Type | String |

### maxAgeInDays



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |


[Back to Table of Content](../../README.md)

