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



[Back to Runbook Reference overview](../../README.md)

