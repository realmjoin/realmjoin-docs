---
title: Add Equipment Mailbox
description: Create an equipment mailbox with optional booking delegates
---

## Description
Creates an equipment mailbox in Exchange Online, for example for a projector or a pool car, so it can be booked in meeting requests. Without booking delegates the equipment accepts requests automatically when it is free. With booking delegates every request waits for their approval; they get no access to the mailbox itself. The user account behind the mailbox can be disabled.

## Location
Organization → Mail → Add Equipment Mailbox

**Full Runbook name**

rjgit-org_mail_add-equipment-mailbox

## Details

| Property | Value |
| --- | --- |
| Version | 2.0.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Creates the equipment mailbox and sets its calendar processing and booking delegates in the app-only Exchange Online session*
- **Type**: Microsoft Graph
  - User.ReadWrite.All *(optional — feature: Disable user account)*
    - *Reads the mailbox's user account and blocks its sign-in via PATCH /users/{id} when DisableUser is on (default)*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session creating the equipment mailbox*


## Parameters
### MailboxName

Alias of the mailbox, which becomes the part of the email address in front of the @ sign.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Alias |

### DisplayName

Name shown in the address book. Leave empty to use the alias.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Display name |

### DelegateTo

Users who approve or decline every booking request for the equipment. Leave empty to accept requests automatically when the equipment is free.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String[] |

### DisableUser

Blocks sign-in for the user account behind the mailbox. Booking keeps working.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Block sign-in for the mailbox account? |



[Back to Runbook Reference overview](../../README.md)

