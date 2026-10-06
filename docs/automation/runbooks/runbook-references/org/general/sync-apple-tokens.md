---
title: Sync Apple Tokens
description: Sync Apple enrollment and VPP tokens with Intune
---

## Description
Triggers a sync of the Apple tokens in Intune, so device enrollments from Apple Business Manager and app licenses from the Volume Purchase Program are up to date. Either token type or both can be synced.

## Location
Organization → General → Sync Apple Tokens

**Full Runbook name**

rjgit-org_general_sync-apple-tokens

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementApps.ReadWrite.All
    - *Reads Apple VPP tokens and triggers syncLicenses for each of them*
  - DeviceManagementServiceConfig.ReadWrite.All
    - *Reads DEP onboarding settings and triggers syncWithAppleDeviceEnrollmentProgram for ADE tokens*


## Parameters
### SyncType

Sync the Enrollment Program tokens, the VPP tokens, or both.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Both |
| Type | String |
| Portal display name | Tokens to sync |

**Portal options**

| Portal option | Value |
| --- | --- |
| Sync both Enrollment and VPP tokens | Both |
| Sync Enrollment Program tokens only | EnrollmentTokens |
| Sync VPP tokens only | VPPTokens |



[Back to Runbook Reference overview](../../README.md)

