---
title: Add Or Remove Public Folder
description: Add or remove a public folder
---

## Description
Creates or removes an Exchange Online public folder. The runbook assumes that at least one public folder mailbox already exists and does not provision public folder mailboxes.

## Location
Organization → Mail → Add Or Remove Public Folder

**Full Runbook name**

rjgit-org_mail_add-or-remove-public-folder

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>ExchangeOnlineManagement (>= 3.9.0) |
| Schedulable | no |

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

