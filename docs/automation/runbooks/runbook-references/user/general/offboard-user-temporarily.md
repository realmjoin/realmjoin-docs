---
title: Offboard User Temporarily
description: Temporarily offboard this user
---

## Description
Offboards this user for a while, for example for parental leave or a sabbatical. Sign-in is blocked, licenses and groups are adjusted, and the group memberships can be exported before they are changed. Group ownerships, direct reports and sponsorships of guests can be handed over to a replacement. The account itself stays.

## Preset the offboarding policy via tenant settings

Most switches of this runbook are backed by tenant settings, so an organization can fix its offboarding policy once and hide the corresponding fields from the operators. The example below presets every switch and hides the fields; keep only the fields the operators should still decide per run.

```json
{
    "Settings": {
        "OffboardUserTemporarily": {
            "userTypeRestriction": 0,
            "disableUser": true,
            "revokeAccess": true,
            "exportGroupMemberships": true,
            "licensesMode": 0,
            "groupsMode": 0,
            "groupToAdd": "",
            "groupsToRemovePrefix": "",
            "replaceManagerReferences": true,
            "replaceSponsorReferences": true
        },
        "RJReport": {
            "StorageAccount": {
                "ResourceGroup": "rj-test-runbooks-01",
                "StorageAccountName": "rjrbexports01",
                "LinkExpiryDays": 6
            }
        }
    },
    "Runbooks": {
        "rjgit-user_general_offboard-user-temporarily": {
            "ParameterList": [
                { "Name": "UserTypeSelector", "Hide": true },
                { "Name": "DisableUser", "Hide": true },
                { "Name": "RevokeAccess", "Hide": true },
                { "Name": "ChangeLicensesSelector", "Hide": true },
                { "Name": "ChangeGroupsSelector", "Hide": true },
                { "Name": "GroupToAdd", "Hide": true },
                { "Name": "GroupsToRemovePrefix", "Hide": true },
                { "Name": "CallerName", "Hide": true }
            ]
        }
    }
}
```

Meaning of the settings:

- `userTypeRestriction`: `0` allows all user types, `1` members only, `2` guests only. A mismatching user stops the run before any change.
- `disableUser`, `revokeAccess`: block sign-in and end the user's sessions.
- `exportGroupMemberships`: export the group memberships to the report storage account (see `RJReport.StorageAccount`) and return a download link before groups and licenses are changed.
- `licensesMode`: `0` keeps the directly assigned licenses, `2` removes all of them.
- `groupsMode`: `0` keeps the groups, `1` removes the groups starting with `groupsToRemovePrefix`, `2` removes all groups. Both `1` and `2` add or keep `groupToAdd`.
- `replaceManagerReferences`, `replaceSponsorReferences`: hand the user's direct reports and sponsorships over to the replacement person.

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).


## Location
User → General → Offboard User Temporarily

**Full Runbook name**

rjgit-user_general_offboard-user-temporarily

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All
    - *Disables sign-in, revokes sessions, removes direct license assignments and replaces manager and sponsor references*
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
  - *Required so the user writes also succeed against role-holding users*
- Exchange Administrator
  - *Required for the app-only Exchange Online session removing distribution group memberships*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### UserTypeSelector

Runs only for the chosen user type: all users, members only or guests only. With a mismatch the run stops before any change.

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

### DisableUser

Blocks the account from signing in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### RevokeAccess

Ends the user's active sessions and invalidates their refresh tokens.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### exportGroupMemberships

Exports the user's group memberships to a file and returns a download link before groups and licenses are changed. Taken from the tenant setting OffboardUserTemporarily.exportGroupMemberships.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### ContainerName

Storage container the export is uploaded to. Set per runbook.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | user-leaver-groupmemberships |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group of the storage account for report uploads. Taken from the tenant setting RJReport.StorageAccount.ResourceGroup.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account for report uploads. Taken from the tenant setting RJReport.StorageAccount.StorageAccountName.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### LinkExpiryDays

Number of days a download link stays valid. Taken from the tenant setting RJReport.StorageAccount.LinkExpiryDays.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6 |
| Type | Int32 |
| Hidden in portal | yes (preset via runbook customization) |

### ChangeLicensesSelector

Remove all takes away every directly assigned license; licenses inherited from groups stay.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Directly assigned licenses |

**Portal options**

| Portal option | Value |
| --- | --- |
| Do not change assigned licenses | 0 |
| Remove all directly assigned licenses | 2 |

### ChangeGroupsSelector

Remove groups with the prefix removes the groups named by the prefix, Remove all groups removes every group. Both add or keep the group under "Group to add or keep". Dynamic, role-assignable and on-premises groups are skipped and listed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Group memberships |

**Portal options**

| Portal option | Value |
| --- | --- |
| Do not change assigned groups | 0 |
| Remove groups with the prefix | 1 |
| Remove all groups | 2 |

### GroupToAdd

Group the user still needs after offboarding, for example a leaver license group. It is added if missing and never removed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GroupsToRemovePrefix

Groups whose name starts with this text are removed, for example LIC_ for all license groups. Only used with "Remove groups with the prefix".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### RevokeGroupOwnership

Remove or replace takes the user's group ownerships away. Where this user is the last owner, the replacement takes over; without a replacement the group is listed for manual follow-up. Keep leaves the ownerships as they are.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Group ownerships |

**Portal options**

| Portal option | Value |
| --- | --- |
| Keep the user's ownerships | false |
| Remove or replace the user's ownerships | true |

### ManagerAsReplacementOwner

Takes the user's manager from Entra ID as the replacement owner, manager and sponsor. If a manager is set, it is used instead of the "Replacement person".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Use the manager as replacement? |

### ReplacementOwnerName

Person who takes over ownerships, direct reports and sponsorships when the manager is not used or this user has none.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ReplaceManagerReferences

Sets the replacement as manager of everyone who reports to this user. Without a replacement, those users are only listed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Manager of direct reports |

**Portal options**

| Portal option | Value |
| --- | --- |
| Keep this user as manager of their direct reports | false |
| Set the replacement as manager of the direct reports | true |

### ReplaceSponsorReferences

Replaces this user as sponsor wherever they are set as one, typically on guest users. Without a replacement, those users are only listed. Sponsorships held through a group stay. This scans all users of the tenant.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Sponsor of guests |

**Portal options**

| Portal option | Value |
| --- | --- |
| Keep this user as sponsor | false |
| Replace this user as sponsor of (guest) users | true |



[Back to Runbook Reference overview](../../README.md)

