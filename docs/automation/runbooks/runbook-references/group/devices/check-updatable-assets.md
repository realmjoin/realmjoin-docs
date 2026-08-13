---
title: Check Updatable Assets
description: Check if devices in a group are onboarded to Windows Update for Business.
---

## Description
This runbook checks the Windows Update for Business onboarding status for all device members of a Microsoft Entra ID group.
It queries each device and reports the enrollment state per update category and any returned error details.
Use this to validate whether group members are correctly registered as updatable assets.

## Location
Group → Devices → Check Updatable Assets

**Full Runbook name**

rjgit-group_devices_check-updatable-assets

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
  - Group.Read.All
  - WindowsUpdates.ReadWrite.All

### Permission notes
Azure: Contributor on Storage Account


## Parameters
### GroupId

Object ID of the group whose device members will be checked.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

