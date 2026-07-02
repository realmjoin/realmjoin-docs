---
title: Add Mail Contact
description: Create a new Exchange Online mail contact with optional display name and address list settings
---

## Description
This runbook creates a new Exchange Online mail contact (external contact) using the New-MailContact cmdlet. You can optionally set the contact's first name, last name, email alias, and control whether it appears in the Global Address List. All names default to the provided display name if not explicitly set.

## Location
Organization → Mail → Add Mail Contact

**Full Runbook name**

rjgit-org_mail_add-mail-contact

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange Administrator


## Parameters
### ExternalEmailAddress

The external SMTP email address for the mail contact. This is the primary email address used for communication with the contact.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DisplayName

The display name shown for the mail contact in Exchange Online and the Global Address List.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Name

The unique contact name used for management and identification. If left empty, defaults to the DisplayName value.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### FirstName

The first name of the contact. If not specified, the field is left empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### LastName

The last name of the contact. If not specified, the field is left empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Alias

The mail nickname (alias) for the mail contact. If not specified, the system generates one automatically from the display name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### HideFromAddressLists

If set to true, the mail contact will be hidden from the Global Address List and other address lists. If false, the contact is visible to all users. Defaults to false.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

