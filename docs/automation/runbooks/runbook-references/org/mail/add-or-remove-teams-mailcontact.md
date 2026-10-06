---
title: Add Or Remove Teams Mailcontact
description: Give a Teams channel a friendly email address or remove it
---

## Description
Creates a mail contact that forwards a friendly email address to the long address Teams generates for a channel. People can then email the channel with an address they can remember. The same runbook removes the friendly address again.

## Location
Organization → Mail → Add Or Remove Teams Mailcontact

**Full Runbook name**

rjgit-org_mail_add-or-remove-teams-mailContact

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
    - *Runs New-/Set-MailContact and Get-EXORecipient in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session creating the relay mail contact*


## Parameters
### RealAddress

Email address that Teams generated for the channel.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Channel email address |

### DesiredAddress

Friendly address that should forward to the channel.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Friendly email address |

### DisplayName

Name shown for the contact in the address book. Leave empty to use the part of the friendly address before the @ sign.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Name in the address book |

### Remove

Set up the friendly address creates the mail contact; Remove the friendly address deletes it again.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Set up the friendly address | false |
| Remove the friendly address | true |



[Back to Runbook Reference overview](../../README.md)

