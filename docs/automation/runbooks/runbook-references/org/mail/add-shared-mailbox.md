---
title: Add Shared Mailbox
description: Create a shared mailbox.
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

The display name for the shared mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### DomainName

The domain name to be used for the primary SMTP address of the shared mailbox. If not specified, the default domain will be used.

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

The user to delegate access to the shared mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### AutoMapping

If set to true, the shared mailbox will be automatically mapped in Outlook for the delegate user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### MessageCopyForSentAsEnabled

If set to true, a copy of sent emails will be saved in the shared mailbox's Sent Items folder when sent as the shared mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### MessageCopyForSendOnBehalfEnabled

If set to true, a copy of sent emails will be saved in the shared mailbox's Sent Items folder when sent on behalf of the shared mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### DisableUser

If set to true, the associated EntraID user account will be disabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |


[Back to Table of Content](../../README.md)

