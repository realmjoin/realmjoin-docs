---
title: Get Bitlocker Recovery Key
description: Get the BitLocker recovery key
---

## Description
This runbook retrieves a BitLocker recovery key using the recovery key ID from the BitLocker recovery screen.
It returns key details and related device information.

## Location
Organization → Devices → Get Bitlocker Recovery Key

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
  - BitlockerKey.Read.All


## Parameters
### bitlockeryRecoveryKeyId

Recovery key ID of the desired key.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

