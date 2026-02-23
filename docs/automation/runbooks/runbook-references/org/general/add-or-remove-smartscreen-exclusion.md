---
title: Add Or Remove Smartscreen Exclusion
description: Add or remove a SmartScreen URL indicator in Microsoft Defender
---

## Description
This runbook lists, adds, or removes URL indicators in Microsoft Defender.
It can allow, audit, warn, or block a given domain by creating an indicator entry.

## Location
Organization → General → Add Or Remove Smartscreen Exclusion

## Permissions
### Application permissions
- **Type**: WindowsDefenderATP
  - Ti.ReadWrite.All


## Parameters
### action

"List all URL indicators", "Add an URL indicator" or "Remove all indicator for this URL" could be selected as action to perform.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

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

