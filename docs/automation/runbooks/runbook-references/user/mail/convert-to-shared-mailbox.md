---
title: Convert To Shared Mailbox
description: Convert a user mailbox to a shared mailbox and back
---

## Description
Converts a mailbox to a shared mailbox or reverts it back to a regular user mailbox. Optionally delegates access and adjusts group memberships and license groups.

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

User principal name of the mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### delegateTo

User principal name of the delegate who should receive access.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Remove

If set to true, converts a shared mailbox back to a regular mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### AutoMapping

If set to true, enables automatic Outlook mapping for delegated FullAccess.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### RemoveGroups

If set to true, removes existing group memberships when converting to a shared mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ArchivalLicenseGroup

Display name of a license group to assign when an archive or larger mailbox requires it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### RegularLicenseGroup

Display name of a license group to assign when converting back to a regular mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

