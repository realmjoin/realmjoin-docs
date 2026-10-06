---
title: Hide Or Unhide In Addressbook
description: Hide this user's mailbox in the address book or show it
---

## Description
Hides the mailbox of this user from the global address list or shows it again. A hidden mailbox still receives email; it just does not appear when people browse the address book. The change can take up to 72 hours to show in the address list.

## Location
User → Mail → Hide Or Unhide In Addressbook

**Full Runbook name**

rjgit-user_mail_hide-or-unhide-in-addressbook

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Runs Set-Mailbox -HiddenFromAddressListsEnabled in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session hiding or showing the mailbox*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### HideMailbox

Whether the mailbox is hidden or shown. Set by the "Action" choice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Hide the mailbox |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

