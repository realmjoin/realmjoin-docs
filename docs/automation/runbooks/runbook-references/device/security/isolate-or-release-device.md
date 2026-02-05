---
title: Isolate Or Release Device
description: Isolate this device.
---

## Description
Isolate this device using Defender for Endpoint.

## Location
Device → Security → Isolate Or Release Device

## Permissions
### Application permissions
- **Type**: WindowsDefenderATP
  - Machine.Read.All
  - Machine.Isolate


## Parameters
### DeviceId



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Release



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | Boolean |

### IsolationType



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Full |
| Type | String |

### Comment



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Possible security risk. |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

