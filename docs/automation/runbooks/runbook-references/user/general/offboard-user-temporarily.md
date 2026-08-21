---
title: Offboard User Temporarily
description: Temporarily offboard a user
---

## Description
Temporarily offboards a user for scenarios such as parental leave or sabbatical by disabling access, adjusting group and license assignments, and optionally exporting memberships. Optionally removes or replaces group ownerships when required.

## Location
User → General → Offboard User Temporarily

**Full Runbook name**

rjgit-user_general_offboard-user-temporarily

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Az.Storage (>= 9.7.2)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All
    - *Disables sign-in, revokes sessions and removes direct license assignments*
  - Group.ReadWrite.All
    - *Reads groups and owned objects and transfers group ownerships*
  - GroupMember.ReadWrite.All
    - *Adds and removes group memberships when changing or clearing groups*
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Opens the app-only Exchange Online session used to remove the user from distribution groups*

### Permission notes
Azure IaaS: Contributor access on subscription or resource group used for the export

### RBAC roles
- User Administrator
  - *Required so the user writes also succeed against role-holding users*
- Exchange Administrator
  - *Required for the app-only Exchange Online session removing distribution group memberships*


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### RevokeAccess

If set to true, revokes the user's refresh tokens and active sessions.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### DisableUser

If set to true, disables the user account for sign-in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### exportResourceGroupName

Azure Resource Group name for exporting data to storage.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### exportStorAccountName

Azure Storage Account name for exporting data to storage.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### exportStorAccountLocation

Azure region used when creating the Storage Account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### exportStorAccountSKU

SKU name used when creating the Storage Account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### exportStorContainerGroupMembershipExports

Container name used for group membership exports.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### exportGroupMemberships

If set to true, exports the user's current group memberships to Azure Storage.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### ChangeLicensesSelector

Controls how directly assigned licenses should be handled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Change directly assigned licenses |

**Portal options**

| Portal option | Value |
| --- | --- |
| Do not change assigned licenses | 0 |
| Remove all directly assigned licenses | 2 |

### ChangeGroupsSelector

Controls how assigned groups should be handled. "Change" and "Remove all" will both honour "groupToAdd".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Change assigned groups |

**Portal options**

| Portal option | Value |
| --- | --- |
| Do not change assigned groups | 0 |
| Change the user's groups | 1 |
| Remove all groups | 2 |

### GroupToAdd

Group that should be added or kept when group changes are enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GroupsToRemovePrefix

Prefix used to remove groups matching a naming convention.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### RevokeGroupOwnership

If set to true, removes or replaces the user's group ownerships.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Handle group ownerships |

**Portal options**

| Portal option | Value |
| --- | --- |
| User will remain owner / Do not change | false |
| Remove/Replace this user's group ownerships | true |

### ReplacementOwnerName

Who will take over group ownership if the offboarded user is the last remaining group owner? Will only be used if needed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

