---
title: Check Assignments Of Devices
description: Show which Intune policies and apps target given devices
---

## Description
Lists the Intune policies, and optionally the apps, that apply to one or more devices by resolving the devices' group memberships and matching them against the assignments. Nothing is changed.

## Location
Organization → General → Check Assignments Of Devices

**Full Runbook name**

rjgit-org_general_check-assignments-of-devices

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
    - *Resolves device names via /devices and lists /devices/{id}/transitiveMemberOf*
  - Group.Read.All
    - *Reads the group objects returned by transitiveMemberOf to match assignment targets*
  - DeviceManagementConfiguration.Read.All
    - *Lists Intune configuration, group policy and compliance policies and their assignments*
  - DeviceManagementApps.Read.All
    - *Lists mobile apps and their assignments when IncludeApps is enabled*


## Parameters
### DeviceNames

Names of the devices to check, separated by commas.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Device names |

### IncludeApps

Also lists the apps assigned to the devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include app assignments? |



[Back to Runbook Reference overview](../../README.md)

