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
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Runs the mailbox and recipient permission read cmdlets in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session to read mailbox permissions*


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

