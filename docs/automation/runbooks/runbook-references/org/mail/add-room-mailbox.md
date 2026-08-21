---
title: Add Room Mailbox
description: Create a room mailbox resource
---

## Description
Creates an Exchange Online room mailbox and optionally configures delegation and calendar processing. If requested, the associated Entra ID user account is disabled after creation.

## Location
Organization → Mail → Add Room Mailbox

**Full Runbook name**

rjgit-org_mail_add-room-mailbox

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
    - *Creates the room mailbox and configures delegation and calendar processing in the app-only Exchange Online session*
- **Type**: Microsoft Graph
  - User.ReadWrite.All *(optional — feature: Disable user account)*
    - *Disables the mailbox's user account via PATCH /users/{id} when DisableUser is enabled (default on)*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session creating the room mailbox*


## Parameters
### MailboxName

Alias (mail nickname) for the room mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DisplayName

Optional display name for the room mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### DelegateTo

Optional user who receives delegated access to the mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Capacity

Optional room capacity in number of people.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

### AutoAccept

If set to true, meeting requests are automatically accepted.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### AutoMapping

If set to true, the mailbox is automatically mapped in Outlook for the delegate.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### DisableUser

If set to true, the associated Entra ID user account is disabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

