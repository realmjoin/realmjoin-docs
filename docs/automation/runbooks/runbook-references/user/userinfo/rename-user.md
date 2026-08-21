---
title: Rename User
description: Rename a user or mailbox
---

## Description
Renames a user by changing the user principal name in Microsoft Entra ID and optionally updates mailbox properties in Exchange Online. This does not update user metadata such as display name, given name, or surname.

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

User principal name of the user or mailbox to rename.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### NewUpn

New user principal name to set.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | New UserPrincipalName |

### ChangeMailnickname

If set to true, updates the mailbox alias and name based on the new UPN.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Change MailNickname based on new UPN |

### UpdatePrimaryAddress

If set to true, updates the primary SMTP address and rewrites email addresses accordingly.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Update primary eMail address |



[Back to Runbook Reference overview](../../README.md)

