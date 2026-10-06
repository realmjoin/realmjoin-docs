---
title: Add Or Remove Tenant Allow Block List
description: Add or remove a Tenant Allow/Block List entry
---

## Description
Adds a sender, URL or file hash to the Tenant Allow/Block List of Defender for Office 365, or removes it again. New entries expire after the chosen number of days, so temporary exceptions clean themselves up.

## Location
Organization → Mail → Add Or Remove Tenant Allow Block List

**Full Runbook name**

rjgit-org_mail_add-or-remove-tenant-allow-block-list

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
    - *Runs Get/New/Remove-TenantAllowBlockListItems in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session to manage Defender Tenant Allow/Block List entries*


## Parameters
### Entry

What to allow or block: a domain, an email address, a URL, or a file hash, matching the entry type.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### ListType

Sender takes a domain or email address, URL a web address, File hash a SHA-256 hash.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Sender |
| Type | String |

### Block

Block list rejects matching mail, URLs or files; Allow list lets them through even when Defender would filter them.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### Remove

Add the entry creates it with the chosen expiry; Remove the entry deletes the existing entry with the same value.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### DaysToExpire

Days until a new entry expires and is removed automatically.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |



[Back to Runbook Reference overview](../../README.md)

