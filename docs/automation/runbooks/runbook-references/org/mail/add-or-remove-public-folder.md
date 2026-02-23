---
title: Add Or Remove Public Folder
description: Add or remove a public folder
---

## Description
Creates or removes an Exchange Online public folder. The runbook assumes that at least one public folder mailbox already exists and does not provision public folder mailboxes.

## Location
Organization → Mail → Add Or Remove Public Folder

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### PublicFolderName

Name of the public folder to create or remove.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### MailboxName

Optional target public folder mailbox to create the folder in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### AddPublicFolder

If set to true, the public folder is created; if set to false, it is removed.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

