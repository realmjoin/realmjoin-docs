---
title: Show Or Hide In Address Book
description: Show or hide a group in the address book
---

## Description
This runbook shows or hides a Microsoft 365 group or a distribution group from address lists.
You can also query the current visibility state without making changes.

## Location
Group → Mail → Show Or Hide In Address Book

**Full Runbook name**

rjgit-group_mail_show-or-hide-in-address-book

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | ExchangeOnlineManagement (>= 3.9.2)<br>RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### GroupName

The identity of the target group (name, alias, or other Exchange identity value).

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Action

"Show Group in Address Book" (final value: 0), "Hide Group from Address Book" (final value: 1) or "Query current state only" (final value: 2) can be selected as action to perform. If set to 0, the runbook will make the group visible in address lists. If set to 1, it will hide the group from address lists. If set to 2, it will return whether the group is currently hidden from address lists without making any changes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Show Group in Address Book | 0 |
| Hide Group from Address Book | 1 |
| Query current state only | 2 |



[Back to Runbook Reference overview](../../README.md)

