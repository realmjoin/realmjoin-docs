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

**Full Runbook name**

rjgit-device_security_isolate-or-release-device

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

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
| Hidden in portal | yes (preset via runbook customization) |

### Release

"Isolate Device" (final value: false) or "Release Device from Isolation" (final value: true) can be selected as action to perform. If set to false, the runbook will isolate the device in Defender for Endpoint. If set to true, it will release a previously isolated device from isolation in Defender for Endpoint.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Isolate Device | false |
| Release Device from Isolation | true |

### IsolationType

The isolation type to use when isolating the device.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Full |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Comment

A short reason for the (un)isolation action.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Possible security risk. |
| Type | String |
| Portal display name | Reason for (Un)Isolation |



[Back to Runbook Reference overview](../../README.md)

