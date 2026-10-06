---
title: Enable Or Disable Device
description: Enable or disable this device in Entra ID
---

## Description
Disables or re-enables the Entra ID object of this device. A disabled device can no longer be used to sign in, which blocks a lost or compromised device; enabling it again lifts the block. Nothing on the device itself is changed.

## Location
Device → Security → Enable Or Disable Device

**Full Runbook name**

rjgit-device_security_enable-or-disable-device

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
    - *Looks up the device via /devices to check its OS and current enabled state*

### RBAC roles
- Cloud Device Administrator
  - *Required for the PATCH on /devices/{id} that enables or disables the device*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Enable

Disable blocks sign-ins from the device. Enable again lifts an earlier block.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Disable or enable this device |

**Portal options**

| Portal option | Value |
| --- | --- |
| Disable device | false |
| Enable device again | true |



[Back to Runbook Reference overview](../../README.md)

