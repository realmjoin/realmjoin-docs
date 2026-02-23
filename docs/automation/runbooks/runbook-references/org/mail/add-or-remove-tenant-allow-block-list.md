---
title: Add Or Remove Tenant Allow Block List
description: Add or remove entries from the Tenant Allow/Block List
---

## Description
Adds or removes entries from the Tenant Allow/Block List in Microsoft Defender for Office 365. The runbook supports senders, URLs, and file hashes and sets new entries to expire after 30 days by default.

## Location
Organization → Mail → Add Or Remove Tenant Allow Block List

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### Entry

The entry to add or remove (for example: domain, email address, URL, or file hash).

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### ListType

Type of entry to manage.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Sender |
| Type | String |

### Block

"Block List (block entry)" (final value: $true) or "Allow List (permit entry)" (final value: $false) can be selected as list type.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### Remove

"Add entry to the list" (final value: $false) or "Remove entry from the list" (final value: $true) can be selected as action to perform.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### DaysToExpire

Number of days until a newly added entry expires.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |



[Back to Runbook Reference overview](../../README.md)

