---
title: Hide Or Unhide In Addressbook
description: Hide or unhide a mailbox in the address book
---

## Description
Hides or unhides a mailbox from the global address lists. Important: This change can take up to 72 hours until it is reflected in the global address list.

## Location
User → Mail → Hide Or Unhide In Addressbook

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

### HideMailbox

If set to true, hides the mailbox from address lists.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

