---
title: Rename User
description: Rename a user or mailbox
---

## Description
Renames a user by changing the user principal name in Microsoft Entra ID and optionally updates mailbox properties in Exchange Online. This does not update user metadata such as display name, given name, or surname.

## Location
User → Userinfo → Rename User

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Directory.Read.All
  - User.ReadWrite.All
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


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

### ChangeMailnickname

If set to true, updates the mailbox alias and name based on the new UPN.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### UpdatePrimaryAddress

If set to true, updates the primary SMTP address and rewrites email addresses accordingly.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

