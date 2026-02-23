---
title: Add Equipment Mailbox
description: Create an equipment mailbox
---

## Description
Creates an Exchange Online equipment mailbox and optionally configures delegate access and calendar processing. If requested, the associated Entra ID user account is disabled after creation.

## Location
Organization → Mail → Add Equipment Mailbox

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### MailboxName

Alias (mail nickname) for the equipment mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DisplayName

Optional display name for the equipment mailbox.

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

