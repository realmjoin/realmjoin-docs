---
title: Set Out Of Office
description: Set or remove automatic replies for this user
---

## Description
Turns on automatic replies for the mailbox of this user, with separate messages for people inside and outside the organization and for a period you choose. A matching out-of-office entry can be added to the calendar. Existing automatic replies can also be switched off again; a calendar entry created earlier is not removed.

## Location
User → Mail → Set Out Of Office

**Full Runbook name**

rjgit-user_mail_set-out-of-office

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
    - *Runs Get-/Set-MailboxAutoReplyConfiguration in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session changing the auto-reply settings*


## Parameters
### UserName

User principal name of the mailbox the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Disable

Enable automatic replies turns them on for the period and messages below. Disable switches existing automatic replies off.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Automatic replies |

**Portal options**

| Portal option | Value |
| --- | --- |
| Enable automatic replies | false |
| Disable automatic replies | true |

### Start

When the automatic replies begin.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | (Get-Date) |
| Type | DateTime |
| Portal display name | Start date |

### End

When the automatic replies stop.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | ((Get-Date) + (New-TimeSpan -Days 3650)) |
| Type | DateTime |
| Portal display name | End date |

### MessageInternal

Reply sent to people inside the organization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Sorry, this person is currently not able to receive your message. |
| Type | String |
| Portal display name | Message for colleagues |

### MessageExternal

Reply sent to people outside the organization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Sorry, this person is currently not able to receive your message. |
| Type | String |
| Portal display name | Message for external senders |

### ExternalAudience

None sends no external replies, Known only to saved contacts, All to every external sender.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
| Type | String |
| Portal display name | External audience |

### CreateEvent

Puts a matching out-of-office entry into the user's calendar for the same period.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Add an out-of-office calendar entry? |

### EventSubject

Subject of the out-of-office entry as colleagues see it in the calendar.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Out of Office |
| Type | String |
| Portal display name | Calendar entry title |



[Back to Runbook Reference overview](../../README.md)

