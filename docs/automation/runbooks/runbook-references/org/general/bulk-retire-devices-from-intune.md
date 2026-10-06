---
title: Bulk Retire Devices From Intune
description: Retire several Intune devices by serial number
---

## Description
Retires the Intune devices with the given serial numbers. A retire removes company data and management from each device but leaves personal data in place. Serial numbers that are not found are reported and skipped.

## Location
Organization → General → Bulk Retire Devices From Intune

**Full Runbook name**

rjgit-org_general_bulk-retire-devices-from-intune

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.ReadWrite.All
    - *Finds Intune devices by serial number and retires them via managedDevices/{id}/retire*


## Parameters
### SerialNumbers

Serial numbers of the devices to retire, separated by commas.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Serial numbers |



[Back to Runbook Reference overview](../../README.md)

