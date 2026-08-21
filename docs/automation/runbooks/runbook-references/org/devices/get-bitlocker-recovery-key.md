---
title: Get Bitlocker Recovery Key
description: Get the BitLocker recovery key
---

## Description
This runbook retrieves a BitLocker recovery key using the recovery key ID from the BitLocker recovery screen.
It returns key details and related device information.

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

Recovery key ID of the desired key.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | BitLocker recovery key ID |



[Back to Runbook Reference overview](../../README.md)

