---
title: Add Or Remove Trusted Site
description: Add or remove a URL entry in the Intune Trusted Sites policy
---

## Description
Adds or removes a URL to the Site-to-Zone Assignment List in a Windows custom configuration policy. The runbook can also list all existing Trusted Sites policies and their mappings.

## Location
Organization → General → Add Or Remove Trusted Site

**Full Runbook name**

rjgit-org_general_add-or-remove-trusted-site

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Notes
This runbook uses calls as described in https://call4cloud.nl/2021/09/the-isencrypted-with-steve-zissou/ to decrypt omaSettings. It currently needs to use the Microsoft Graph beta endpoint for this.

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

**Portal options**

| Portal option | Value |
| --- | --- |
| Add URL to Trusted Sites |  |
| Remove URL from Trusted Sites |  |
| List/Print all Trusted Sites Policies |  |

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

**Portal options**

| Portal option | Value |
| --- | --- |
| My Computer (0) | 0 |
| Local Intranet Zone (1) | 1 |
| Trusted sites Zone (2) | 2 |
| Internet Zone (3) | 3 |
| Restricted Sites Zone (4) | 4 |

### DefaultPolicyName

Default policy name used when multiple Trusted Sites policies exist and no specific policy name is provided.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Windows 10 - Trusted Sites |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### IntunePolicyName

Optional policy name; if provided, the runbook targets this policy instead of auto-selecting one.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

