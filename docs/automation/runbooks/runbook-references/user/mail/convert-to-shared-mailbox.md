---
title: Convert To Shared Mailbox
description: Convert this user's mailbox to a shared mailbox or back
---

## Description
Turns the mailbox of this user into a shared mailbox, or turns a shared mailbox back into a regular user mailbox. When converting to shared, a delegate can get full access and the user's group memberships can be removed. A license group can be assigned when the mailbox needs an Exchange Online Plan 2.

## Location
User → Mail → Convert To Shared Mailbox

**Full Runbook name**

rjgit-user_mail_convert-to-shared-mailbox

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Converts the mailbox type and manages permissions and distribution groups in the app-only Exchange Online session*
- **Type**: Microsoft Graph
  - User.ReadWrite.All
    - *Reads the user and toggles accountEnabled when converting to or from a shared mailbox*
  - Group.Read.All *(optional — feature: Group and license handling)*
    - *Finds the regular or archival license group by display name*
  - GroupMember.ReadWrite.All *(optional — feature: Group and license handling)*
    - *Removes group memberships and manages license group membership during conversion*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session converting the mailbox*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### delegateTo

User who gets full access to the shared mailbox. Leave empty to grant no access.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Remove

Whether the shared mailbox is turned back into a regular mailbox. Set by the "Action" choice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### AutoMapping

Makes the shared mailbox appear automatically in the delegate's Outlook.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### RemoveGroups

Takes the user out of all groups, including license groups, when converting to shared.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ArchivalLicenseGroup

Group that assigns an Exchange Online Plan 2 license, needed when the shared mailbox has an archive, is larger than 50 GB or is on litigation hold. Leave empty if not needed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### RegularLicenseGroup

Group that assigns the mailbox license when converting back to a regular mailbox. Leave empty to assign none.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

