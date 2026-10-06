---
title: Check Device Onboarding Exclusion (Scheduled)
description: Keep unenrolled Autopilot devices in a compliance exclusion group
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Puts Windows Autopilot devices that are not yet enrolled in Intune, plus devices enrolled only recently, into an exclusion group. Once they are past that grace period, they are taken out again. Devices in the group can get a longer compliance grace period after enrollment.

## Location
Organization → General → Check Device Onboarding Exclusion (Scheduled)

**Full Runbook name**

rjgit-org_general_check-device-onboarding-exclusion_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.2.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All
    - *Finds or creates the exclusion group and adds/removes device members*
  - Device.Read.All
    - *Resolves Autopilot and Intune azureADDeviceIds to Entra device objects via /devices*
  - DeviceManagementManagedDevices.Read.All
    - *Lists recently enrolled Windows devices via /deviceManagement/managedDevices*
  - DeviceManagementServiceConfig.Read.All
    - *Lists windowsAutopilotDeviceIdentities to match Autopilot devices for the exclusion group*


## Parameters
### exclusionGroupName

Display name of the group that holds the excluded devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Intune - Windows - Compliance for unenrolled Autopilot devices (devices) |
| Type | String |
| Portal display name | Exclusion group name |

### maxAgeInDays

Devices enrolled within this many days stay in the group; older ones are removed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |
| Portal display name | Grace period (days) |



[Back to Runbook Reference overview](../../README.md)

