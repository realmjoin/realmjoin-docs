---
title: Show Bitlocker Recovery Key
description: Show all BitLocker recovery keys for a device
---

## Description
This runbook retrieves and displays all BitLocker recovery keys that are backed up for the specified device.
Keys are sorted by creation date (newest first). Use it for disk recovery scenarios.

## Location
Device → Security → Show Bitlocker Recovery Key

**Full Runbook name**

rjgit-device_security_show-bitlocker-recovery-key

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - BitlockerKey.Read.All


## Parameters
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

