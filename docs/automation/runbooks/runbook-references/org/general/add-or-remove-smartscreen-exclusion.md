---
title: Add Or Remove Smartscreen Exclusion
description: Add or remove a SmartScreen URL indicator in Microsoft Defender
---

## Description
This runbook lists, adds, or removes URL indicators in Microsoft Defender.
It can allow, audit, warn, or block a given domain by creating an indicator entry.

## Location
Organization → General → Add Or Remove Smartscreen Exclusion

**Full Runbook name**

rjgit-org_general_add-or-remove-smartscreen-exclusion

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: WindowsDefenderATP
  - Ti.ReadWrite.All
    - *Lists, creates and deletes domain threat indicators in Defender for Endpoint*


## Parameters
### action

"List all URL indicators", "Add an URL indicator" or "Remove all indicator for this URL" could be selected as action to perform.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| List all URL indicators | 0 |
| Add an URL indicator | 1 |
| Remove all indicator for this URL | 2 |

### Url

Domain name to manage, for example "exclusiondemo.com".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### mode

Indicator mode to apply.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Allow, Audit, Warn or Block this URL? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Allow | 0 |
| Audit | 1 |
| Warn | 2 |
| Block | 3 |

### explanationTitle

Title used when creating an indicator.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Allow this domain in SmartScreen |
| Type | String |

### explanationDescription

Description used when creating an indicator.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Required exclusion. Please provide more details. |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

