---
title: Add Microsoft Store App Logos
description: Update logos of Microsoft Store Apps (new) in Intune
---

## Description
This runbook updates missing logos for Microsoft Store Apps (new) in Intune by fetching the icon from the Microsoft Store.
It skips apps that already have a logo and reports how many apps were updated.

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

