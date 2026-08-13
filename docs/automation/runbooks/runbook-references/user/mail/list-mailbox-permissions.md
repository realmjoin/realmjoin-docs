---
title: List Mailbox Permissions
description: List mailbox permissions for a mailbox
---

## Description
Lists different types of permissions like mailbox access, SendAs, and SendOnBehalf permissions for a mailbox. Outputs each permission type as formatted tables. This also works for shared mailboxes.

## Location
User → Mail → List Mailbox Permissions

**Full Runbook name**

rjgit-user_mail_list-mailbox-permissions

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
### UserName

User principal name of the mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

