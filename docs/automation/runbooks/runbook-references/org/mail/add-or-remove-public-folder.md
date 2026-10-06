---
title: Add Or Remove Public Folder
description: Create or remove an Exchange Online public folder
---

## Description
Creates a public folder in Exchange Online, optionally in a chosen public folder mailbox, or removes an existing one. At least one public folder mailbox must already exist; the runbook does not create any.

## Location
Organization → Mail → Add Or Remove Public Folder

**Full Runbook name**

rjgit-org_mail_add-or-remove-public-folder

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
    - *Runs New-/Get-/Remove-PublicFolder in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session to manage public folders*


## Parameters
### PublicFolderName

Name of the public folder to create or remove.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### MailboxName

Public folder mailbox the new folder is created in. Leave empty to let Exchange choose.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### AddPublicFolder

Whether the folder is created or removed. Set by the action selected in the portal.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

