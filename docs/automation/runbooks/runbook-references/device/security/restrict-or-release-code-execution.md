---
title: Restrict Or Release Code Execution
description: Only allow Microsoft-signed code to run on a device, or remove an existing restriction.
---

## Description
This runbook restricts code execution on a device via Microsoft Defender for Endpoint so that only Microsoft-signed code can run.
Optionally, it can remove an existing restriction.
Provide a short reason so the action is documented in the service.

## Location
Device → Security → Restrict Or Release Code Execution

## Permissions
### Application permissions
- **Type**: WindowsDefenderATP
  - Machine.Read.All
  - Machine.RestrictExecution


## Parameters
### DeviceId

The device ID of the target device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Release

"Restrict Code Execution" (final value: false) or "Remove Code Restriction" (final value: true) can be selected as action to perform. If set to false, the runbook will restrict code execution on the device in Defender for Endpoint. If set to true, it will remove an existing code execution restriction on the device in Defender for Endpoint.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | Boolean |

### Comment

A short reason for the (un)restriction action.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Possible security risk. |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

