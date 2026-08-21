---
title: Add Or Remove Email Address
description: Add or remove an email address for a mailbox
---

## Description
Adds or removes an alias email address on a mailbox and can optionally set it as the primary address.

## Location
User → Mail → Add Or Remove Email Address

**Full Runbook name**

rjgit-user_mail_add-or-remove-email-address

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
    - *Adds, removes or promotes SMTP aliases via Set-Mailbox in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session changing the proxy addresses*


## Parameters
### UserName

User principal name of the mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### EmailAddress

Email address to add or remove.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

If set to true, removes the address instead of adding it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Remove this address |
| Hidden in portal | yes (preset via runbook customization) |

### asPrimary

If set to true, sets the specified address as the primary SMTP address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Set as primary address |



[Back to Runbook Reference overview](../../README.md)

