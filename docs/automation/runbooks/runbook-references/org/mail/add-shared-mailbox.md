---
title: Add Shared Mailbox
description: Create a shared mailbox
---

## Description
This script creates a shared mailbox in Exchange Online and configures various settings such as delegation, auto-mapping, and message copy options.
Also if specified, it disables the associated EntraID user account.

## Location
Organization → Mail → Add Shared Mailbox

**Full Runbook name**

rjgit-org_mail_add-shared-mailbox

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
    - *Creates the shared mailbox and sets delegation and regional settings in the app-only Exchange Online session*
- **Type**: Microsoft Graph
  - User.ReadWrite.All *(optional — feature: Disable user account)*
    - *Disables the mailbox's user account via PATCH /users/{id} when DisableUser is enabled (default on)*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session creating the shared mailbox*


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

**Portal options**

| Portal option | Value |
| --- | --- |
| en-US | en-US |
| de-DE | de-DE |
| fr-FR | fr-FR |

### TimeZone

The time zone for the shared mailbox. Default is "W. Europe Standard Time".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | W. Europe Standard Time |
| Type | String |

**Portal options**

| Portal option | Value |
| --- | --- |
| W. Europe Standard Time | W. Europe Standard Time |
| Central Europe Standard Time | Central Europe Standard Time |
| E. Europe Standard Time | E. Europe Standard Time |
| GMT Standard Time | GMT Standard Time |
| UTC | UTC |
| Eastern Standard Time | Eastern Standard Time |
| Central Standard Time | Central Standard Time |
| Mountain Standard Time | Mountain Standard Time |
| Pacific Standard Time | Pacific Standard Time |
| Alaska Standard Time | Alaska Standard Time |
| Hawaiian Standard Time | Hawaiian Standard Time |
| China Standard Time | China Standard Time |
| Tokyo Standard Time | Tokyo Standard Time |
| Korea Standard Time | Korea Standard Time |
| India Standard Time | India Standard Time |
| Arabian Standard Time | Arabian Standard Time |
| AUS Eastern Standard Time | AUS Eastern Standard Time |
| New Zealand Standard Time | New Zealand Standard Time |
| Romance Standard Time | Romance Standard Time |
| Russian Standard Time | Russian Standard Time |
| SA Pacific Standard Time | SA Pacific Standard Time |
| SE Asia Standard Time | SE Asia Standard Time |
| Singapore Standard Time | Singapore Standard Time |
| South Africa Standard Time | South Africa Standard Time |
| Turkey Standard Time | Turkey Standard Time |
| Argentina Standard Time | Argentina Standard Time |
| Atlantic Standard Time | Atlantic Standard Time |
| Canada Central Standard Time | Canada Central Standard Time |
| E. South America Standard Time | E. South America Standard Time |
| FLE Standard Time | FLE Standard Time |
| Israel Standard Time | Israel Standard Time |
| Middle East Standard Time | Middle East Standard Time |
| Nepal Standard Time | Nepal Standard Time |
| West Pacific Standard Time | West Pacific Standard Time |

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

