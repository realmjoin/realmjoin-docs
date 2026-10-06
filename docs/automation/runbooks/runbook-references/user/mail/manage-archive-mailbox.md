---
title: Manage Archive Mailbox
description: Enable, disable or check the archive mailbox of this user
---

## Description
Enables or disables the in-place archive mailbox of this user, or shows its current status. Nothing changes when the mailbox is already in the requested state. When enabling, an archive that was disabled within the last 30 days is reconnected instead of creating a new one.

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

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Action

Whether the archive is enabled, disabled or only its status shown. Set by the "Action" choice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | GetStatus |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

