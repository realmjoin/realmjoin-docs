---
title: Enable Or Disable Device
description: Enable or disable a device in Entra ID
---

## Description
This runbook enables or disables a Windows device object in Entra ID (Azure AD) based on the provided device ID.
Use it to temporarily block sign-ins from a compromised or lost device, or to re-enable the device after remediation.

## Location
Device → Security → Enable Or Disable Device

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

### Enable

"Disable Device?" (final value: false) or "Enable Device again?" (final value: true) can be selected as action to perform. If set to false, the runbook will disable the device in Entra ID (Azure AD). If set to true, the runbook will enable the device in Entra ID (Azure AD) again.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

