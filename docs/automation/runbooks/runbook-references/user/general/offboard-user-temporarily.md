---
title: Offboard User Temporarily
description: Temporarily offboard a user
---

## Description
Temporarily offboards a user for scenarios such as parental leave or sabbatical by disabling access, adjusting group and license assignments, and optionally exporting memberships. Optionally removes or replaces group ownerships when required.

## Location
User → General → Offboard User Temporarily

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All
  - Group.ReadWrite.All
  - GroupMember.ReadWrite.All

### Permission notes
Azure IaaS: Contributor access on subscription or resource group used for the export

### RBAC roles
- User administrator


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

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

### exportStorAccountName

Azure Storage Account name for exporting data to storage.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### exportStorAccountLocation

Azure region used when creating the Storage Account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### exportStorAccountSKU

SKU name used when creating the Storage Account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### exportStorContainerGroupMembershipExports

Container name used for group membership exports.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### exportGroupMemberships

If set to true, exports the user's current group memberships to Azure Storage.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ChangeLicensesSelector

Controls how directly assigned licenses should be handled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

### ChangeGroupsSelector

Controls how assigned groups should be handled. "Change" and "Remove all" will both honour "groupToAdd".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

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

### ReplacementOwnerName

Who will take over group ownership if the offboarded user is the last remaining group owner? Will only be used if needed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

