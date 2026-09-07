---
title: Offboard User Permanently
description: Permanently offboard a user
---

## Description
Permanently offboards a user by revoking access, disabling or deleting the account, adjusting group and license assignments, and optionally exporting memberships. Optionally removes or replaces group ownerships when required and replaces the user as manager of direct reports and as sponsor of (guest) users.

## Location
User → General → Offboard User Permanently

**Full Runbook name**

rjgit-user_general_offboard-user-permanently

## Details

| Property | Value |
| --- | --- |
| Version | 1.2.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All
    - *Disables sign-in, revokes sessions, removes licenses, replaces manager and sponsor references and deletes the user object*
  - Group.ReadWrite.All
    - *Reads groups and transfers or removes the user's group ownerships*
  - GroupMember.ReadWrite.All
    - *Adds and removes group memberships during the group cleanup*
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Opens the app-only Exchange Online session used to remove the user from distribution groups*

### Permission notes
Azure Storage Account: 'Storage Account Contributor' role for the Automation Account's managed identity on the target storage account - the upload retrieves the account keys via listKeys (only required when exportGroupMemberships is used)

### RBAC roles
- User Administrator
  - *Required so the app-only identity can block sign-in, revoke sessions and delete the user*
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

### UserTypeSelector

Controls which user types this runbook may be run against: all users, member users only or guest users only. The run aborts before any change if the selected user does not match. To enforce the restriction, configure it as a tenant setting and hide the parameter via RunbookCustomization - otherwise operators can change it in the runbook form.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Restrict to a user type |

**Portal options**

| Portal option | Value |
| --- | --- |
| Allow all user types (Members and Guests) | 0 |
| Members only | 1 |
| Guests only | 2 |

### DeleteUser

"Delete user object" (final value: $true) or "Keep the user object" (final value: $false) can be selected as action to perform. If set to true, the user object will be deleted. If set to false, the user object will be kept but access will be revoked and sign-in will be blocked.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

**Portal options**

| Portal option | Value |
| --- | --- |
| Delete user object | true |
| Keep the user object | false |

### DisableUser

If set to true, disables the user account for sign-in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### RevokeAccess

If set to true, revokes the user's refresh tokens and active sessions.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### exportGroupMemberships

If set to true, exports the user's current group memberships to an Azure Storage Account and returns a time-limited download link.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### ContainerName

Storage container name used for the group membership export.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | user-leaver-groupmemberships |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group that contains the storage account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account name used for the upload.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### LinkExpiryDays

Number of days until the generated download link expires.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6 |
| Type | Int32 |
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

"Change" and "Remove all" will both honour "groupToAdd"

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
| Change the user's groups. | 1 |
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

"Remove/Replace this user's group ownerships" (final value: $true) or "User will remain owner / Do not change" (final value: $false) can be selected as action to perform. If set to true, the runbook will attempt to remove the user from group ownerships. If the user is the last owner of a group, it will attempt to assign a replacement owner; if that fails, it will skip ownership change for that group and log it for manual follow-up.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Handle group ownerships |

**Portal options**

| Portal option | Value |
| --- | --- |
| User will remain owner / Do not change | false |
| Remove/Replace this user's group ownerships | true |

### ManagerAsReplacementOwner

If set to true, uses the user's manager as replacement owner where applicable.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ReplacementOwnerName

User who will take over group or resource ownership if required.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ReplaceManagerReferences

If set to true, all direct reports of the offboarded user get the replacement person assigned as their new manager. Without a resolvable replacement, affected users are only listed for manual follow-up.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Handle manager references |

**Portal options**

| Portal option | Value |
| --- | --- |
| Keep this user as manager of their direct reports | false |
| Set the replacement as manager of the direct reports | true |

### ReplaceSponsorReferences

If set to true, the offboarded user is replaced by the replacement person wherever they are set as sponsor (typically on guest users). Without a resolvable replacement, affected users are only listed for manual follow-up. Sponsorships that the user only holds through a group membership are left untouched, as they remain valid after the offboarding. As Graph offers no reverse lookup for sponsors, this option scans all users of the tenant.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Handle sponsor references |

**Portal options**

| Portal option | Value |
| --- | --- |
| Keep this user as sponsor | false |
| Replace this user as sponsor of (guest) users | true |



[Back to Runbook Reference overview](../../README.md)

