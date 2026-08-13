---
title: Unassign Windows365
description: Remove and deprovision a Windows 365 Cloud PC for a user
---

## Description
Removes Windows 365 assignments for a user and deprovisions the associated Cloud PC. Optionally ends the grace period immediately to trigger faster removal.

## Location
User → General → Unassign Windows365

**Full Runbook name**

rjgit-user_general_unassign-windows365

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - GroupMember.ReadWrite.All
  - Group.ReadWrite.All
  - CloudPC.ReadWrite.All


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### licWin365GroupName

Display name of the Windows 365 license group or Frontline provisioning policy to remove.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |
| Portal display name | Windows 365 license/Frontline prov. policy to remove from |

### cfgProvisioningGroupPrefix

Prefix used to detect provisioning-related configuration groups.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - Provisioning - |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### cfgUserSettingsGroupPrefix

Prefix used to detect user-settings-related configuration groups.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - User Settings - |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### licWin365GroupPrefix

Prefix used to detect Windows 365 license groups.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | lic - Windows 365 Enterprise - |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### skipGracePeriod

If set to true, ends the Cloud PC grace period immediately.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Remove Cloud PC immediately |

### KeepUserSettingsAndProvisioningGroups

If set to true, does not remove related provisioning and user settings groups.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

