---
title: Set Room Mailbox Configuration
description: Set room mailbox resource policies
---

## Description
Updates room mailbox settings such as booking policy, calendar processing, and capacity. The runbook can optionally restrict BookInPolicy to members of a specific mail-enabled security group.

## Location
User → Mail → Set Room Mailbox Configuration

**Full Runbook name**

rjgit-user_mail_set-room-mailbox-configuration

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>ExchangeOnlineManagement (>= 3.9.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### UserName

User principal name of the room mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### AllBookInPolicy

"Allow BookIn for everyone" (final value: $true) or "Custom BookIn Policy" (final value: $false) can be selected as action to perform. If set to true, the room will allow BookIn for everyone and the BookInPolicyGroup parameter will be ignored. If set to false, only members of the group specified in the BookInPolicyGroup parameter will be allowed to BookIn.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

**Portal options**

| Portal option | Value |
| --- | --- |
| Allow BookIn for everyone | true |
| Custom BookIn Policy | false |

### BookInPolicyGroup

Group whose members are allowed to book when AllBookInPolicy is false.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### AllowRecurringMeetings

If set to true, allows recurring meetings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### AutomateProcessing

Calendar processing mode for the room mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | AutoAccept |
| Type | String |

**Portal options**

| Portal option | Value |
| --- | --- |
| Auto Accept | AutoAccept |
| Auto Update | AutoUpdate |
| None | None |

### BookingWindowInDays

How many days into the future bookings are allowed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 180 |
| Type | Int32 |

### MaximumDurationInMinutes

Maximum meeting duration in minutes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1440 |
| Type | Int32 |

### AllowConflicts

If set to true, allows scheduling conflicts.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### Capacity

Capacity to set for the room when greater than 0.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |



[Back to Runbook Reference overview](../../README.md)

