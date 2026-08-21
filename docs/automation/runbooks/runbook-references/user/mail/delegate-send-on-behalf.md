---
title: Delegate Send On Behalf
description: Delegate SendOnBehalf permissions for the user's mailbox
---

## Description
Grants or removes SendOnBehalf permissions for a delegate on the user's mailbox. Outputs the resulting SendOnBehalf trustees after applying the change.
This allows the delegate to send emails on behalf of the mailbox owner.

## Location
User → Mail → Delegate Send On Behalf

**Full Runbook name**

rjgit-user_mail_delegate-send-on-behalf

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
    - *Runs Set-Mailbox -GrantSendOnBehalfTo in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session managing send-on-behalf delegations*


## Parameters
### UserName

User principal name of the mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### delegateTo

User principal name of the delegate.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

If set to true, removes the delegation instead of granting it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

