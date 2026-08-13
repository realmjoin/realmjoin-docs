---
title: Hide Or Unhide In Addressbook
description: Hide or unhide a mailbox in the address book
---

## Description
Hides or unhides a mailbox from the global address lists. Important: This change can take up to 72 hours until it is reflected in the global address list.

## Location
User → Mail → Hide Or Unhide In Addressbook

**Full Runbook name**

rjgit-user_mail_hide-or-unhide-in-addressbook

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

User principal name of the mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### HideMailbox

If set to true, hides the mailbox from address lists.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Hide the Mailbox |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

