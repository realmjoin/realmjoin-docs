---
title: Check Defender Status
description: Check this device in Entra ID and Defender for Endpoint
---

## Description
Looks up this device in Entra ID and in Microsoft Defender for Endpoint. It shows whether the device exists in each, its onboarding and health state in Defender, and its Defender risk score. A medium or high risk score is flagged. Nothing is changed.

## Location
Device → Security → Check Defender Status

**Full Runbook name**

rjgit-device_security_check-defender-status

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
    - *Reads the Entra device object to report display name, enabled state, trust type, OS and last sign-in*
- **Type**: WindowsDefenderATP
  - Machine.Read.All
    - *Queries the Defender for Endpoint /machines API to read onboarding status, health state, last seen and risk score*


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

