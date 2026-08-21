---
title: Remove Mailbox
description: Hard delete a shared mailbox, room or bookings calendar
---

## Description
Forces a deletion of a shared mailbox, room mailbox, or bookings calendar. The mailbox type is validated before deletion.

## Location
User → Mail → Remove Mailbox

**Full Runbook name**

rjgit-user_mail_remove-mailbox

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
    - *Runs Get-Mailbox and Remove-Mailbox in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Runs Get-Mailbox and Remove-Mailbox to hard delete shared, room or scheduling mailboxes*


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

