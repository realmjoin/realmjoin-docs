---
title: Add Or Remove Tenant Allow Block List
description: Add or remove entries from the Tenant Allow/Block List.
---

## Description
Add or remove entries from the Tenant Allow/Block List in Microsoft Defender for Office 365.
Allows blocking or allowing senders, URLs, or file hashes. A new entry is set to expire in 30 days by default.

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

The entry to add or remove (e.g., domain, email address, URL, or file hash).

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### ListType

The type of entry: Sender, Url, or FileHash.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Sender |
| Type | String |

### Block

Decides whether to block or allow the entry.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### Remove

Decides whether to remove or add the entry.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### DaysToExpire

Number of days until the entry expires. Default is 30 days.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |


[Back to Table of Content](../../README.md)

