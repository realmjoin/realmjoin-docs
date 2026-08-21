---
title: Add Defender Indicator
description: Create a new Microsoft Defender for Endpoint indicator
---

## Description
Creates a new indicator in Microsoft Defender for Endpoint to allow or block a specific file hash, certificate thumbprint, IP, domain, or URL. The indicator action can generate alerts automatically for audit or alert-and-block actions.

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
| Portal display name | IndicatorType |

**Portal options**

| Portal option | Value |
| --- | --- |
| File Sha256 | FileSha256 |
| File Sha1 | FileSha1 |
| File Md5 | FileMd5 |
| Certificate Thumbprint | CertificateThumbprint |
| Ip Address | IpAddress |
| Domain Name | DomainName |
| Url | Url |

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
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Alert | Alert |
| Warn | Warn |
| Block | Block |
| Audit | Audit |
| Block And Remediate | BlockAndRemediate |
| Alert And Block | AlertAndBlock |
| Allowed | Allowed |

### Severity

Severity used for the indicator.

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

If set to true, an alert is generated when the indicator matches.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

