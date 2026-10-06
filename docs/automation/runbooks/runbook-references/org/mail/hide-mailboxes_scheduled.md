---
title: Hide Mailboxes (Scheduled)
description: Hide or show all Bookings calendars in the address book
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Hides every Microsoft Bookings calendar mailbox from the global address list, or shows them again, on each run. New Bookings calendars are covered automatically the next time the runbook runs.

## Location
Organization → Mail → Hide Mailboxes (Scheduled)

**Full Runbook name**

rjgit-org_mail_hide-mailboxes_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.3 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Runs Get-/Set-Mailbox in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Runs Get-/Set-Mailbox to hide all Bookings scheduling mailboxes from the address list*


## Parameters
### HideBookingCalendars

Hidden calendars cannot be found in Outlook or the address book; turn off to list them again.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | True |
| Type | Boolean |
| Portal display name | Hide Bookings calendars? |



[Back to Runbook Reference overview](../../README.md)

