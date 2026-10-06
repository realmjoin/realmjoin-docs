---
title: Show Laps Password
description: Show the local admin password of this device
---

## Description
Shows the most recent Windows LAPS password of the local administrator account that is backed up for this device. Use it for break-glass troubleshooting and rotate the password afterwards. Looking it up changes nothing on the device.

## Location
Device → Security → Show Laps Password

**Full Runbook name**

rjgit-device_security_show-laps-password

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceLocalCredential.Read.All
    - *Reads /directory/deviceLocalCredentials/{id} to decode and display the LAPS password*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

