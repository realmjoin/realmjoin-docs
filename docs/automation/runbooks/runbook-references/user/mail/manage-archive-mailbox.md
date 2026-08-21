---
title: Manage Archive Mailbox
description: Manage the Exchange Online archive mailbox for a user
---

## Description
Enables, disables, or retrieves the current status of the in-place archive mailbox for an Exchange Online user. Before any change the current state is verified so the script exits without making changes if the mailbox is already in the desired state. When enabling, any soft-deleted archive mailbox from within the last 30 days is automatically reconnected instead of creating a new one.

## Location
User → Mail → Manage Archive Mailbox

**Full Runbook name**

rjgit-user_mail_manage-archive-mailbox

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
    - *Runs Get-Mailbox and Enable-/Disable-Mailbox -Archive in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the managed identity's app-only Exchange Online session to toggle the online archive*


## Parameters
### UserName

User principal name of the user whose archive mailbox should be managed.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Action

Action to perform: Enable, Disable, or GetStatus.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | GetStatus |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

