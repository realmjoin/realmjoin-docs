---
title: Add Room Mailbox
description: Create a room mailbox with optional booking delegates
---

## Description
Creates a room mailbox in Exchange Online so the room can be booked in meeting requests. Without booking delegates the room accepts requests automatically when it is free. With booking delegates every request waits for their approval; they get no access to the mailbox itself. The user account behind the mailbox can be disabled so nobody signs in with it.

## Location
Organization → Mail → Add Room Mailbox

**Full Runbook name**

rjgit-org_mail_add-room-mailbox

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
    - *Creates the room mailbox and sets its calendar processing and booking delegates in the app-only Exchange Online session*
- **Type**: Microsoft Graph
  - User.ReadWrite.All *(optional — feature: Disable user account)*
    - *Reads the mailbox's user account and blocks its sign-in via PATCH /users/{id} when DisableUser is on (default)*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session creating the room mailbox*


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

Name shown in the address book and the room finder. Leave empty to use the alias.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Display name |

### DelegateTo

Users who approve or decline every booking request for the room. Leave empty to accept requests automatically when the room is free.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String[] |

### Capacity

How many people fit in the room. Shown in the room finder. Leave at 0 to set no capacity.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Room capacity (people) |

### DisableUser

Blocks sign-in for the user account behind the mailbox. Booking keeps working.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Block sign-in for the mailbox account? |



[Back to Runbook Reference overview](../../README.md)

