---
title: Set Out Of Office
description: Enable or disable mailbox out-of-office notifications
---

## Description
Configures automatic replies for a mailbox and can optionally create an out-of-office calendar event. The runbook can either enable scheduled replies with internal and external messages or disable existing out-of-office settings.

## Location
User → Mail → Set Out Of Office

**Full Runbook name**

rjgit-user_mail_set-out-of-office

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### UserName

User principal name of the mailbox. This value is auto-filled by the portal.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Disable

Select whether to enable out-of-office notifications or disable existing out-of-office settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### Start

Start time for scheduled out-of-office replies.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | (Get-Date) |
| Type | DateTime |

### End

End time for scheduled out-of-office replies. If not specified, it defaults to 10 years from the current date.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | ((Get-Date) + (New-TimeSpan -Days 3650)) |
| Type | DateTime |

### MessageInternal

Internal automatic reply message.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Sorry, this person is currently not able to receive your message. |
| Type | String |

### MessageExternal

External automatic reply message.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Sorry, this person is currently not able to receive your message. |
| Type | String |

### ExternalAudience

Controls who receives external automatic replies. Use None to send no external replies, Known to send replies only to known external contacts, or All to send replies to all external senders.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | All |
| Type | String |

### CreateEvent

If set to true, creates an out-of-office calendar event.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### EventSubject

Subject for the optional out-of-office calendar event.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Out of Office |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

