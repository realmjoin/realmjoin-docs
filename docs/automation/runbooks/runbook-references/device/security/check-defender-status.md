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

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
- **Type**: WindowsDefenderATP
  - Machine.Read.All


## Parameters
### DeviceId

The Entra device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

