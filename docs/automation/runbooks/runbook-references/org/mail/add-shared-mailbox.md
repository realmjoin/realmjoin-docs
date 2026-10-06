---
title: Add Shared Mailbox
description: Create a shared mailbox with optional delegate
---

## Description
Creates a shared mailbox in Exchange Online with the chosen language and time zone. A delegate can get full access, and sent mails can be kept in the shared Sent Items folder. The user account behind the mailbox can be disabled so nobody signs in with it.

## Offer the accepted domains as a list

The domain of the new mailbox is free text by default. With a runbook customization the operator picks it from the accepted domains of the tenant instead:

```json
{
        "Runbooks": {
        "rjgit-org_mail_add-shared-mailbox": {
            "ParameterList": [
                {
                    "Name": "DomainName",
                    "Select": {
                        "Options": [
                                {
                                    "Value": "contoso.onmicrosoft.com"
                                },
                                {
                                    "Value": "contoso.com"
                                }
                            ]
                    },
                    "DefaultValue": "contoso.com"
                }
            ]
        }
    }
}
```

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).


## Location
Organization → Mail → Add Shared Mailbox

**Full Runbook name**

rjgit-org_mail_add-shared-mailbox

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
    - *Creates the shared mailbox and sets delegation and regional settings in the app-only Exchange Online session*
- **Type**: Microsoft Graph
  - User.ReadWrite.All *(optional — feature: Disable user account)*
    - *Disables the mailbox's user account via PATCH /users/{id} when DisableUser is enabled (default on)*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session creating the shared mailbox*


## Parameters
### MailboxName

Alias of the mailbox, which becomes the part of the email address in front of the @ sign.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Alias |

### DisplayName

Name shown in the address book. Leave empty to use the alias.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### DomainName

Domain of the email address. Leave empty to use the default domain of the tenant.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Domain |

### Language

Language of the mailbox, which sets the names of the default folders such as Inbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | en-US |
| Type | String |
| Portal display name | Language |

**Portal options**

| Portal option | Value |
| --- | --- |
| en-US | en-US |
| de-DE | de-DE |
| fr-FR | fr-FR |

### TimeZone

Time zone used for the calendar and timestamps of the mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | W. Europe Standard Time |
| Type | String |
| Portal display name | Time zone |

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

User who gets full access to the mailbox. Leave empty for none.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### AutoMapping

The mailbox opens automatically in the delegate's Outlook.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### MessageCopyForSentAsEnabled

Mails sent as the shared mailbox are also stored in its Sent Items folder.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### MessageCopyForSendOnBehalfEnabled

Mails sent on behalf of the shared mailbox are also stored in its Sent Items folder.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### DisableUser

Blocks sign-in for the user account behind the mailbox. Delegates keep their access.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

