---
title: List Room Mailbox Configuration
description: Show the booking configuration of this room mailbox
---

## Description
Shows the room details and the calendar processing settings of this room mailbox, such as how booking requests are handled. It also lists the resource delegates who approve requests and the users and groups that may book the room directly or only request it. Nothing is changed.

## Location
User → Mail → List Room Mailbox Configuration

**Full Runbook name**

rjgit-user_mail_list-room-mailbox-configuration

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Place.Read.All
    - *Reads the room's place metadata via /places/{mail}/microsoft.graph.room*
  - User.Read.All
    - *Resolves the mail address of the room mailbox via /users/{UserName}*
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Runs Get-CalendarProcessing and resolves the delegates and booking policy entries with Get-Recipient in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session to read the calendar processing settings*


## Parameters
### UserName

User principal name of the room mailbox the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

