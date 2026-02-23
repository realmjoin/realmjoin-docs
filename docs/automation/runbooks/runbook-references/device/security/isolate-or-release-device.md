---
title: Isolate Or Release Device
description: Isolate this device.
---

## Description
This runbook isolates a device in Microsoft Defender for Endpoint to reduce the risk of lateral movement and data exfiltration.
Optionally, it can release a previously isolated device.
Provide a short reason so the action is documented in the service.

## Location
Device → Security → Isolate Or Release Device

## Permissions
### Application permissions
- **Type**: WindowsDefenderATP
  - Machine.Read.All
  - Machine.Isolate


## Parameters
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Release

"Isolate Device" (final value: false) or "Release Device from Isolation" (final value: true) can be selected as action to perform. If set to false, the runbook will isolate the device in Defender for Endpoint. If set to true, it will release a previously isolated device from isolation in Defender for Endpoint.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | Boolean |

### IsolationType

The isolation type to use when isolating the device.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Full |
| Type | String |

### Comment

A short reason for the (un)isolation action.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Possible security risk. |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

