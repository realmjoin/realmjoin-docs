---
title: Restrict Or Release Code Execution
description: Restrict this device to Microsoft-signed code or lift the restriction
---

## Description
Restricts this device through Microsoft Defender for Endpoint so that only Microsoft-signed code can run, which blocks unsigned tools an attacker may have placed on it. It can also lift an existing restriction. Give a short reason; it is recorded with the action in Defender.

## Location
Device → Security → Restrict Or Release Code Execution

**Full Runbook name**

rjgit-device_security_restrict-or-release-code-execution

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: WindowsDefenderATP
  - Machine.Read.All
    - *Finds the Defender for Endpoint machine via /machines filtered by aadDeviceId*
  - Machine.RestrictExecution
    - *Triggers restrictCodeExecution or unrestrictCodeExecution on the machine*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Release

Restrict allows only Microsoft-signed code to run on the device. Remove lifts an existing restriction.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Restrict code execution | false |
| Remove code restriction | true |

### Comment

Short reason for the restriction or its removal. It is stored with the action in Defender for Endpoint.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Possible security risk. |
| Type | String |
| Portal display name | Reason |



[Back to Runbook Reference overview](../../README.md)

