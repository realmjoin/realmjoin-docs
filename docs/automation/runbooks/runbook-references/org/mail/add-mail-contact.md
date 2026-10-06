---
title: Add Mail Contact
description: Create a mail contact for an external address
---

## Description
Creates a mail contact in Exchange Online for an external email address, so the person can be found in the address book and added to groups. First name, last name, contact name and alias are optional; the contact can be hidden from the address lists.

## Location
Organization → Mail → Add Mail Contact

**Full Runbook name**

rjgit-org_mail_add-mail-contact

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
    - *Runs New-/Set-MailContact and Get-MailContact/Get-Recipient preflight checks in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the managed identity's app-only Exchange Online session to create mail contacts*


## Parameters
### ExternalEmailAddress

External address of the person. Mail to the contact is delivered there.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | External email address |

### DisplayName

Name shown in the address book.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Display name |

### Name

Unique name used to manage the contact in Exchange Online. Leave empty to use the display name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Contact name |

### FirstName

First name of the person. Can stay empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | First name |

### LastName

Last name of the person. Can stay empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Last name |

### Alias

Mail alias of the contact. Leave empty to have Exchange derive one from the contact name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Alias |

### HideFromAddressLists

Hides the contact from the global address list and the other address lists.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Hide from address lists? |



[Back to Runbook Reference overview](../../README.md)

