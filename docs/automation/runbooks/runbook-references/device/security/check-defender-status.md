---
title: Check Defender Status
description: Check a device's presence and risk status in Entra ID and Microsoft Defender for Endpoint
---

## Description
This runbook compares a device between Entra ID and Microsoft Defender for Endpoint based on its Entra device ID. It reports whether the device exists in each service, returns key properties like onboarding and health state, and evaluates the Defender risk score to flag elevated risk.

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

The Entra device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

