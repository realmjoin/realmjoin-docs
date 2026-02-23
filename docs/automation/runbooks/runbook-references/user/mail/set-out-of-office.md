---
title: Set Out Of Office
description: Enable or disable out-of-office notifications for a mailbox
---

## Description
Configures automatic replies for a mailbox and optionally creates an out-of-office calendar event. The runbook can either enable scheduled replies or disable them.

## Location
User → Mail → Set Out Of Office

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online API
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### UserName

User principal name of the mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Disable

"Enable Out-of-Office" (final value: $false) or "Disable Out-of-Office" (final value: $true) can be selected as action to perform.

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
| Default Value | (get-date) |
| Type | DateTime |

### End

End time for scheduled out-of-office replies. If not specified, defaults to 10 years from the current date.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | ((get-date) + (new-timespan -Days 3650)) |
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

