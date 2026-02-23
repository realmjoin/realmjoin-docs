---
title: Add Or Remove Email Address
description: Add or remove an email address for a mailbox
---

## Description
Adds or removes an alias email address on a mailbox and can optionally set it as the primary address.

## Location
User → Mail → Add Or Remove Email Address

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online API
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### UserName

User principal name of the mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### EmailAddress

Email address to add or remove.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

If set to true, removes the address instead of adding it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### asPrimary

If set to true, sets the specified address as the primary SMTP address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

