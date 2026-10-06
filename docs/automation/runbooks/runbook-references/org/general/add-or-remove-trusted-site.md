---
title: Add Or Remove Trusted Site
description: Add a URL to the Intune trusted sites list or remove it
---

## Description
Adds a URL to the site-to-zone assignment list of a Windows configuration policy in Intune, or removes it again. That list puts a URL into an Internet Explorer security zone such as Trusted sites. It can also list all trusted sites policies with their entries.

## Implementation notes

The runbook decrypts the `omaSettings` of the custom configuration policy using the approach described in [this call4cloud article](https://call4cloud.nl/2021/09/the-isencrypted-with-steve-zissou/). This currently requires the Microsoft Graph beta endpoint.


## Location
Organization → General → Add Or Remove Trusted Site

**Full Runbook name**

rjgit-org_general_add-or-remove-trusted-site

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementConfiguration.ReadWrite.All
    - *Reads and updates the Site-to-Zone assignment policy including secret OMA settings*


## Parameters
### Action

Add puts the URL into the policy, Remove takes it out, List shows the policies and their entries.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 2 |
| Type | Int32 |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add URL to trusted sites | 0 |
| Remove URL from trusted sites | 1 |
| List all trusted sites policies | 2 |

### Url

Address to add or remove, starting with http:// or https://.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Zone

Security zone the URL is assigned to: My computer (0), Local intranet (1), Trusted sites (2), Internet (3) or Restricted sites (4).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |

**Portal options**

| Portal option | Value |
| --- | --- |
| My computer (0) | 0 |
| Local intranet (1) | 1 |
| Trusted sites (2) | 2 |
| Internet (3) | 3 |
| Restricted sites (4) | 4 |

### DefaultPolicyName

Policy used when several trusted sites policies exist and none is named.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Windows 10 - Trusted Sites |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### IntunePolicyName

Policy to change. Leave empty to pick one automatically.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

