---
title: Show Bitlocker Recovery Key
description: Show all BitLocker recovery keys for a device
---

## Description
This runbook retrieves and displays all BitLocker recovery keys that are backed up for the specified device.
Keys are sorted by creation date (newest first). Use it for disk recovery scenarios.

## Location
Device → Security → Show Bitlocker Recovery Key

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - BitLockerKey.Read.All


## Parameters
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

