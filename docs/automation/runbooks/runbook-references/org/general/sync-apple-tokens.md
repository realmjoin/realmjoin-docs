---
title: Sync Apple Tokens
description: Sync Apple Enrollment Program Tokens and VPP Tokens with Intune
---

## Description
This runbook triggers synchronization of Apple tokens in Microsoft Intune. It can sync Apple Enrollment Program (ADE) tokens, Volume Purchase Program (VPP) tokens, or both. The sync ensures that Intune has the latest information from Apple Business Manager regarding device enrollments and app licenses.

## Location
Organization → General → Sync Apple Tokens

**Full Runbook name**

rjgit-org_general_sync-apple-tokens

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementApps.ReadWrite.All
  - DeviceManagementServiceConfig.ReadWrite.All


## Parameters
### SyncType

Select which token type(s) to synchronize with Apple Business Manager.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Both |
| Type | String |
| Portal display name | Sync Type |

**Portal options**

| Portal option | Value |
| --- | --- |
| Sync both Enrollment and VPP tokens | Both |
| Sync Enrollment Program tokens only | EnrollmentTokens |
| Sync VPP tokens only | VPPTokens |



[Back to Runbook Reference overview](../../README.md)

