---
title: Add Or Remove Smartscreen Exclusion
description: Allow, warn or block a URL in Defender SmartScreen
---

## Description
Manages URL indicators in Microsoft Defender for Endpoint, which SmartScreen uses to allow, audit, warn about or block a domain. Lists the existing indicators, adds one for a domain, or removes all indicators for it.

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

List shows all URL indicators, Add creates one for the domain, Remove deletes every indicator for it.

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
| Add a URL indicator | 1 |
| Remove all indicators for this URL | 2 |

### Url

Domain to manage, for example exclusiondemo.com.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### mode

What SmartScreen does with the domain: allow it, only audit access, warn the user, or block it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Allow, audit, warn or block? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Allow | 0 |
| Audit | 1 |
| Warn | 2 |
| Block | 3 |

### explanationTitle

Short title stored with the indicator.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Allow this domain in SmartScreen |
| Type | String |

### explanationDescription

Reason stored with the indicator, for example who requested the exclusion.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Required exclusion. Please provide more details. |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

