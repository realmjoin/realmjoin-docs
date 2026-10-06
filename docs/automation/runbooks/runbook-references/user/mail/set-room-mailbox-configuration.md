---
title: Set Room Mailbox Configuration
description: Configure the booking rules and booking delegates of this room mailbox
---

## Description
Sets the booking rules of this room mailbox: who may book it directly, who needs the approval of a booking delegate, and how requests are processed. It also sets recurring meetings, conflicts, the booking window, the maximum meeting length and the capacity. All booking rules are written as shown. The booking group, the booking delegates and the capacity change only when a value is given.

## Booking modes

"Who may book the room" and the fields shown with "Restricted" decide what happens to a meeting request:

- **Everyone** - every user books the room directly; the request is accepted when the room is free.
- **Restricted with a booking group** - members of the "Booking group" book directly. Requests from everyone else are declined.
- **Restricted with "Let everyone else request the room?"** - requests from users outside the booking group go to the booking delegates, who approve or decline them. Leave the "Booking group" empty when the booking delegates decide every request. This is the same as the option "Select delegates who can accept or decline booking requests" in the Exchange admin center.

Booking delegates get requests only with the request processing "Auto accept". With "Auto update" Exchange marks requests as tentative and sends nothing to the delegates. The runbook warns about both cases and about a run that switches off an existing delegate approval.

## Booking delegates

- A booking delegate approves or declines requests for the room in their own mailbox. They need no full access to the room mailbox; Exchange grants them Send on Behalf on its own. Grant full access with the runbook "Delegate Full Access" only when someone has to work in the room mailbox itself.
- "Booking delegate change" decides what happens with the users selected in "Booking delegates": Add keeps the current delegates and adds the selected ones, Replace makes the selected users the only delegates, Remove takes them off the list. With no users selected the delegates stay as they are.
- Users without a mailbox are skipped with a warning. Current delegates whose name does not resolve to exactly one recipient are kept unchanged.
- The runbook "List Room Mailbox Configuration" shows the current booking delegates, the booking group and the request settings of a room.

## Notes and limitations

- Every run writes all booking rules as shown in the dialog. Running the runbook only to change the capacity therefore also resets "Who may book the room" to the selected option.
- An empty "Booking group" keeps the current group; the runbook cannot clear it.
- Tenant-wide defaults for the booking rules can be set as RealmJoin settings: `RoomMailbox.AllBookInPolicy`, `RoomMailbox.AllRequestInPolicy`, `RoomMailbox.AllowRecurringMeetings`, `RoomMailbox.AutomateProcessing`, `RoomMailbox.BookingWindowInDays`, `RoomMailbox.MaximumDurationInMinutes` and `RoomMailbox.AllowConflicts`. A field with a setting is shown read-only in the dialog. See [Settings](https://docs.realmjoin.com/automation/runbooks/runbook-customization#settings) in the Runbook Customization Guide.


## Location
User → Mail → Set Room Mailbox Configuration

**Full Runbook name**

rjgit-user_mail_set-room-mailbox-configuration

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Reads the room mailbox, its calendar processing and booking delegates (Get-EXOMailbox, Get-CalendarProcessing, Get-Recipient) and changes them with Set-CalendarProcessing and Set-Place in the app-only Exchange Online session*
- **Type**: Microsoft Graph
  - Group.Read.All *(optional — feature: Book-in policy group)*
    - *Validates the BookInPolicyGroup via /groups/{id}*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session to change the room mailbox settings*


## Parameters
### UserName

User principal name of the room mailbox the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### AllBookInPolicy

Everyone lets all users book the room directly. Restricted lets only the "Booking group" book directly; everyone else is declined or, with "Let everyone else request the room?", needs a booking delegate's approval.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Who may book the room |

**Portal options**

| Portal option | Value |
| --- | --- |
| Everyone | true |
| Restricted | false |

### BookInPolicyGroup

Mail-enabled security group whose members book the room directly. Leave empty to keep the current group, for example when only the booking delegates decide.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### AllRequestInPolicy

Requests from users outside the "Booking group" go to the booking delegates, who approve or decline them. Turn off to decline these requests.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Let everyone else request the room? |

### AllowRecurringMeetings

Turn off to decline recurring meeting requests; single meetings are still accepted.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Allow recurring meetings? |

### AutomateProcessing

Auto accept books the room automatically or sends the request to the booking delegates. Auto update only marks requests as tentative, and booking delegates get no requests. None leaves requests untouched.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | AutoAccept |
| Type | String |
| Portal display name | Request processing |

**Portal options**

| Portal option | Value |
| --- | --- |
| Auto accept | AutoAccept |
| Auto update | AutoUpdate |
| None | None |

### BookingWindowInDays

Requests further ahead than this many days are declined.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 180 |
| Type | Int32 |
| Portal display name | Booking window (days) |

### MaximumDurationInMinutes

Longest meeting the room accepts, in minutes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1440 |
| Type | Int32 |
| Portal display name | Maximum duration (minutes) |

### AllowConflicts

Lets overlapping bookings through instead of declining them.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Allow conflicting bookings? |

### Capacity

Number of seats. Leave at 0 to keep the current value.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Capacity |

### ResourceDelegates

Users who approve or decline the booking requests that need approval. They get no access to the mailbox itself. Leave empty to keep the current booking delegates.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String[] |

### DelegateAction

Add puts the selected users next to the current booking delegates, Replace makes them the only booking delegates, Remove takes them off the list.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Add |
| Type | String |
| Portal display name | Booking delegate change |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add to current delegates | Add |
| Replace current delegates | Replace |
| Remove from current delegates | Remove |



[Back to Runbook Reference overview](../../README.md)

