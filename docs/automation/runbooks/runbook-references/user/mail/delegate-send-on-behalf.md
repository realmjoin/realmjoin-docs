---
title: Delegate Send On Behalf
description: Grant or remove Send on Behalf permission on this user's mailbox
---

## Description
Lets another person send email on behalf of this user, so recipients see the delegate's name with "on behalf of" this user, or removes that permission again. The resulting list of trustees is shown after the change.

## Location
User → Mail → Delegate Send On Behalf

**Full Runbook name**

rjgit-user_mail_delegate-send-on-behalf

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
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

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### delegateTo

Person who gets or loses the Send on Behalf permission.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

Whether the permission is removed instead of granted. Set by the "Action" choice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

