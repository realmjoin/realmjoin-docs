---
title: Add Or Remove Trusted Site
description: Add/Remove an entry to/from the Intune Windows 10 Trusted Sites Policy
---

## Description
Add/Remove an entry to/from the Intune Windows 10 Trusted Sites Policy

## Location
Organization → General → Add Or Remove Trusted Site

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementConfiguration.ReadWrite.All


## Parameters
### Action



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 2 |
| Type | Int32 |

### Url

Needs to be prefixed with "http://" or "https://"

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Zone



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |

### DefaultPolicyName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Windows 10 - Trusted Sites |
| Type | String |

### IntunePolicyName

Will use an existing policy or default policy name if left empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

