---
title: Add Room Mailbox
description: Create a room mailbox resource
---

## Description
Creates an Exchange Online room mailbox and optionally configures delegation and calendar processing. If requested, the associated Entra ID user account is disabled after creation.

## Location
Organization → Mail → Add Room Mailbox

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


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

