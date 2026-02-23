---
title: Add Or Remove Trusted Site
description: Add or remove a URL entry in the Intune Trusted Sites policy
---

## Description
Adds or removes a URL to the Site-to-Zone Assignment List in a Windows custom configuration policy. The runbook can also list all existing Trusted Sites policies and their mappings.

## Location
Organization → General → Add Or Remove Trusted Site

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementConfiguration.ReadWrite.All


## Parameters
### Action

Action to execute: add, remove, or list policies.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 2 |
| Type | Int32 |

### Url

URL to add or remove; it must be prefixed with "http://" or "https://".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Zone

Internet Explorer zone id to assign the URL to.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |

### DefaultPolicyName

Default policy name used when multiple Trusted Sites policies exist and no specific policy name is provided.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Windows 10 - Trusted Sites |
| Type | String |

### IntunePolicyName

Optional policy name; if provided, the runbook targets this policy instead of auto-selecting one.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

