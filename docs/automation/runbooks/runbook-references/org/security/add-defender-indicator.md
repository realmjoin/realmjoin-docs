---
title: Add Defender Indicator
description: Add an allow or block indicator to Defender for Endpoint
---

## Description
Creates a custom indicator in Microsoft Defender for Endpoint that allows, warns about, audits or blocks a file hash, certificate thumbprint, IP address, domain or URL on all onboarded devices. An alert can be raised whenever the indicator matches.

## Location
Organization → Security → Add Defender Indicator

**Full Runbook name**

rjgit-org_security_add-defender-indicator

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: WindowsDefenderATP
  - Ti.ReadWrite.All
    - *Creates the threat indicator (hash, IP, domain or URL) via POST /indicators in Defender for Endpoint*


## Parameters
### IndicatorValue

The hash, thumbprint, IP address, domain name or URL the indicator applies to. Must match the indicator type.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Indicator value |

### IndicatorType

File hash (SHA-256, SHA-1 or MD5), certificate thumbprint, IP address, domain name or URL. The value must be of this type.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | FileSha256 |
| Type | String |
| Portal display name | Indicator type |

**Portal options**

| Portal option | Value |
| --- | --- |
| File hash (SHA-256) | FileSha256 |
| File hash (SHA-1) | FileSha1 |
| File hash (MD5) | FileMd5 |
| Certificate thumbprint | CertificateThumbprint |
| IP address | IpAddress |
| Domain name | DomainName |
| URL | Url |

### Title

Short name shown for the indicator in the Defender portal.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Title |

### Description

Why the indicator exists. Shown in the Defender portal and in alerts.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Description |

### Action

What Defender does on a match: Allow, Warn, Audit, Block, Block and remediate, or Alert and block.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Allowed |
| Type | String |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Alert | Alert |
| Warn | Warn |
| Block | Block |
| Audit | Audit |
| Block and remediate | BlockAndRemediate |
| Alert and block | AlertAndBlock |
| Allow | Allowed |

### Severity

Severity of the alerts raised for this indicator.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Informational |
| Type | String |
| Portal display name | Severity |

**Portal options**

| Portal option | Value |
| --- | --- |
| Informational | Informational |
| Low | Low |
| Medium | Medium |
| High | High |

### GenerateAlert

Raises an alert in the Defender portal each time the indicator matches.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Raise an alert on match? |



[Back to Runbook Reference overview](../../README.md)

