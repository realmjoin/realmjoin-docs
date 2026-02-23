---
title: Add Shared Mailbox
description: Create a shared mailbox
---

## Description
This script creates a shared mailbox in Exchange Online and configures various settings such as delegation, auto-mapping, and message copy options.
Also if specified, it disables the associated EntraID user account.

## Location
Organization → Mail → Add Shared Mailbox

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### MailboxName

The alias (mailbox name) for the shared mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DisplayName

Display name for the shared mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### DomainName

Optional domain used for the primary SMTP address; if not provided, the default domain is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Language

The language/locale for the shared mailbox. This setting affects folder names like "Inbox". Default is "en-US".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | en-US |
| Type | String |

### DelegateTo

Optional user who receives delegated access to the mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### AutoMapping

If set to true, the mailbox is automatically mapped in Outlook for the delegate.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### MessageCopyForSentAsEnabled

If set to true, copies of messages sent as the mailbox are stored in the mailbox sent items.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### MessageCopyForSendOnBehalfEnabled

If set to true, copies of messages sent on behalf of the mailbox are stored in the mailbox sent items.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### DisableUser

If set to true, the associated Entra ID user account is disabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

