---
title: Hide Mailboxes (Scheduled)
description: Hide or unhide special mailboxes in the Global Address List
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Hides or unhides special mailboxes in the Global Address List, currently intended for Bookings calendars. The runbook updates all scheduling mailboxes accordingly.

## Location
Organization → Mail → Hide Mailboxes (Scheduled)

**Full Runbook name**

rjgit-org_mail_hide-mailboxes_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
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

If set to true, booking calendars are hidden from address lists.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

