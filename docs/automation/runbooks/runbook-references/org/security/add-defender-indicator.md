---
title: Add Defender Indicator
description: Create new Indicator in Defender for Endpoint.
---

## Description
Create a new Indicator in Defender for Endpoint e.g. to allow a specific file using it's hash value or allow a specific url that by default is blocked by Defender for Endpoint

## Location
Organization → Security → Add Defender Indicator

## Permissions
### Application permissions
- **Type**: WindowsDefenderATP
  - Ti.ReadWrite.All


## Parameters
### IndicatorValue



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### IndicatorType



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | FileSha256 |
| Type | String |

### Title



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Description



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Action



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Allowed |
| Type | String |

### Severity



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Informational |
| Type | String |

### GenerateAlert



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

