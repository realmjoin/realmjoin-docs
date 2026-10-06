---
title: Add Or Remove Email Address
description: Add an email address to this user's mailbox or remove one
---

## Description
Adds an alias address to the mailbox of this user or removes one. A new or existing address can also be made the primary address that outgoing mail is sent from.

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

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### EmailAddress

Address to add or remove, for example jane.doe@contoso.com.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Email address |

### Remove

Whether the address is removed instead of added. Set by the "Action" choice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Remove this address |
| Hidden in portal | yes (preset via runbook customization) |

### asPrimary

Makes this address the primary one that outgoing mail is sent from.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Set as primary address? |



[Back to Runbook Reference overview](../../README.md)

