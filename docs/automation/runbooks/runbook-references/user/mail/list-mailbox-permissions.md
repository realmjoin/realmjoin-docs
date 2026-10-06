---
title: List Mailbox Permissions
description: List who has access to this user's mailbox
---

## Description
Shows who has permissions on the mailbox of this user: full access, Send As and Send on Behalf, each as a table in the Output Data tab. Works for shared mailboxes as well. Nothing is changed.

## Location
User → Mail → List Mailbox Permissions

**Full Runbook name**

rjgit-user_mail_list-mailbox-permissions

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
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

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

