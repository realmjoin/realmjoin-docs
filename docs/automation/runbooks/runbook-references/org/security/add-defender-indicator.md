---
title: Add Defender Indicator
description: Create a new Microsoft Defender for Endpoint indicator
---

## Description
Creates a new indicator in Microsoft Defender for Endpoint to allow or block a specific file hash, certificate thumbprint, IP, domain, or URL. The indicator action can generate alerts automatically for audit or alert-and-block actions.

## Location
Organization → Security → Add Defender Indicator

## Permissions
### Application permissions
- **Type**: WindowsDefenderATP
  - Ti.ReadWrite.All


## Parameters
### IndicatorValue

Value of the indicator, such as a hash, thumbprint, IP address, domain name, or URL.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### IndicatorType

Type of the indicator value.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | FileSha256 |
| Type | String |

### Title

Title of the indicator entry.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Description

Description of the indicator entry.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Action

Action applied to the indicator.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Allowed |
| Type | String |

### Severity

Severity used for the indicator.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Informational |
| Type | String |

### GenerateAlert

If set to true, an alert is generated when the indicator matches.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

