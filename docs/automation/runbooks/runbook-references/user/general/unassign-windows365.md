---
title: Unassign Windows365
description: Remove/Deprovision a Windows 365 instance
---

## Description
Remove/Deprovision a Windows 365 instance

## Location
User → General → Unassign Windows365

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - GroupMember.ReadWrite.All
  - Group.ReadWrite.All
  - CloudPC.ReadWrite.All


## Parameters
### UserName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### licWin365GroupName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |

### cfgProvisioningGroupPrefix



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - Provisioning - |
| Type | String |

### cfgUserSettingsGroupPrefix



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - User Settings - |
| Type | String |

### licWin365GroupPrefix



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | lic - Windows 365 Enterprise - |
| Type | String |

### skipGracePeriod



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### KeepUserSettingsAndProvisioningGroups



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

