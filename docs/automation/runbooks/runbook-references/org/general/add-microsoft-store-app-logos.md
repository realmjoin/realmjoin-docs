---
title: Add Microsoft Store App Logos
description: Add missing logos to Microsoft Store apps in Intune
---

## Description
Fetches the icon from the Microsoft Store for every Microsoft Store app (new) in Intune that has no logo yet and sets it. Apps that already have a logo are skipped, and the result shows how many were updated.

## Location
Organization → General → Add Microsoft Store App Logos

**Full Runbook name**

rjgit-org_general_add-microsoft-store-app-logos

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementApps.ReadWrite.All
    - *Lists winGetApp apps and patches each app's largeIcon with the Store logo*


## Parameters


[Back to Runbook Reference overview](../../README.md)

