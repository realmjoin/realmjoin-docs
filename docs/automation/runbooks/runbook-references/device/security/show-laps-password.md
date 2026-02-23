---
title: Show Laps Password
description: Show a local admin password for a device.
---

## Description
This runbook retrieves and displays the most recent Windows LAPS local administrator password that is backed up for the specified device.
Use it for break-glass troubleshooting and rotate the password after use.

## Location
Device → Security → Show Laps Password

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceLocalCredential.Read.All


## Parameters
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

