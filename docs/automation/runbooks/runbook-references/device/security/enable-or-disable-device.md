---
title: Enable Or Disable Device
description: Enable or disable a device in Entra ID
---

## Description
This runbook enables or disables a Windows device object in Entra ID (Azure AD) based on the provided device ID.
Use it to temporarily block sign-ins from a compromised or lost device, or to re-enable the device after remediation.

## Location
Device → Security → Enable Or Disable Device

**Full Runbook name**

rjgit-device_security_enable-or-disable-device

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All

### RBAC roles
- Cloud device administrator


## Parameters
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Enable

"Disable Device?" (final value: false) or "Enable Device again?" (final value: true) can be selected as action to perform. If set to false, the runbook will disable the device in Entra ID (Azure AD). If set to true, the runbook will enable the device in Entra ID (Azure AD) again.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Disable or Enable Device |

**Portal options**

| Portal option | Value |
| --- | --- |
| Disable Device | false |
| Enable Device again | true |



[Back to Runbook Reference overview](../../README.md)

