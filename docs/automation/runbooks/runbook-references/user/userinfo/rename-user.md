---
title: Rename User
description: Change this user's sign-in name (UPN) and mailbox alias
---

## Description
Gives this user a new user principal name in Entra ID and, optionally, updates the mailbox alias and the primary email address in Exchange Online to match. Display name, given name and surname are not touched.

## Location
User → Userinfo → Rename User

**Full Runbook name**

rjgit-user_userinfo_rename-user

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All
    - *Patches /users/{UPN} to set the new user principal name*
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Runs Get-EXOMailbox and Set-Mailbox to update alias and SMTP addresses after the rename*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session rewriting the mailbox addresses*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### NewUpn

New sign-in name, for example jane.doe@contoso.com.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | New user principal name |

### ChangeMailnickname

Sets the mailbox alias and name from the new user principal name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Update the mailbox alias? |

### UpdatePrimaryAddress

Makes the new user principal name the primary email address; the previous addresses stay as aliases.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Update the primary email address? |



[Back to Runbook Reference overview](../../README.md)

