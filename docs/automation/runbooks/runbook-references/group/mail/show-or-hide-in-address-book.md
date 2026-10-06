---
title: Show Or Hide In Address Book
description: Show or hide this group in the address book
---

## Description
Shows this Microsoft 365 or distribution group in the address lists or hides it from them. A hidden group still receives email at its address; it just does not appear in the address book. Query only shows the current state without changing anything.

## Location
Group → Mail → Show Or Hide In Address Book

**Full Runbook name**

rjgit-group_mail_show-or-hide-in-address-book

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | ExchangeOnlineManagement (>= 3.9.2)<br>RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Runs Set-UnifiedGroup or Set-DistributionGroup with -HiddenFromAddressListsEnabled in the app-only session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session hiding or showing the group*


## Parameters
### GroupName

Identity of the group in Exchange Online, such as its name or alias. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Action

Show lists the group in the address book, Hide removes it from the lists, Query only shows the current state.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Show group in address book | 0 |
| Hide group from address book | 1 |
| Query current state only | 2 |



[Back to Runbook Reference overview](../../README.md)

