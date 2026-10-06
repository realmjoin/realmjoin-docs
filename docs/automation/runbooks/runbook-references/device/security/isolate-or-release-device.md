---
title: Isolate Or Release Device
description: Isolate this device from the network or release it
---

## Description
Isolates this device in Microsoft Defender for Endpoint so that, with full isolation, it can only talk to the Defender service. That limits lateral movement and data theft during an incident. It can also release a previously isolated device. Give a short reason; it is recorded with the action in Defender.

## Location
Device → Security → Isolate Or Release Device

**Full Runbook name**

rjgit-device_security_isolate-or-release-device

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: WindowsDefenderATP
  - Machine.Read.All
    - *Looks up the Defender for Endpoint machine via /machines filtered by aadDeviceId*
  - Machine.Isolate
    - *Triggers the isolate or unisolate action on the machine*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Release

Isolate cuts the device off from the network, with full isolation except for the Defender service. Release restores its normal connectivity.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Isolate device | false |
| Release device from isolation | true |

### IsolationType

Full blocks all traffic except to Defender; Selective keeps Outlook, Teams and Skype for Business working. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Full |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Comment

Short reason for the isolation or release. It is stored with the action in Defender for Endpoint.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Possible security risk. |
| Type | String |
| Portal display name | Reason |



[Back to Runbook Reference overview](../../README.md)

