---
title: Check Updatable Assets
description: Check if devices in a group are onboarded to Windows Update for Business.
---

## Description
This script checks if single or multiple devices (by Group Object ID) are onboarded to Windows Update for Business.

## Location
Group → Devices → Check Updatable Assets

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

Object ID of the group to check onboarding status for its members.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |


[Back to Table of Content](../../README.md)

