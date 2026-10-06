---
title: Get Bitlocker Recovery Key
description: Look up a BitLocker recovery key by its key ID
---

## Description
Finds the BitLocker recovery key that belongs to the key ID shown on a device's recovery screen and returns the key together with the device it belongs to. Use it when a user is locked out at the BitLocker prompt.

## Location
Organization → Devices → Get Bitlocker Recovery Key

**Full Runbook name**

rjgit-org_devices_get-bitlocker-recovery-key

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
    - *Reads the key's device details (display name, trust type, compliance) via /devices*
  - BitlockerKey.Read.All
    - *Retrieves the recovery key value via /informationProtection/bitlocker/recoveryKeys/{id}*


## Parameters
### bitlockeryRecoveryKeyId

The key ID displayed on the BitLocker recovery screen of the device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | BitLocker recovery key ID |



[Back to Runbook Reference overview](../../README.md)

