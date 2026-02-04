---
title: Add Or Remove Smartscreen Exclusion
description: Add/Remove a SmartScreen URL Exception/Rule in MS Security Center Indicators
---

## Description
List/Add/Remove URL indicators entries in MS Security Center.

## Location
Organization → General → Add Or Remove Smartscreen Exclusion

## Permissions
### Application permissions
- **Type**: WindowsDefenderATP
  - Ti.ReadWrite.All


## Parameters
### action

0 - list, 1 - add, 2 - remove

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

### Url

please give just the name of the domain, like "exclusiondemo.com"

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### mode

0 - allow, 1 - audit, 2 - warn, 3 - block

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

### explanationTitle



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Allow this domain in SmartScreen |
| Type | String |

### explanationDescription



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Required exclusion. Please provide more details. |
| Type | String |


[Back to Table of Content](../../README.md)

