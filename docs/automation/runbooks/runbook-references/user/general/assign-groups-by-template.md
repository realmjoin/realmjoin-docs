---
title: Assign Groups By Template
description: Assign cloud-only groups to a user based on a predefined template.
---

## Description
Assign cloud-only groups to a user based on a predefined template.

## Location
User → General → Assign Groups By Template

## Parameters
### UserId



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### GroupsTemplate

GroupsTemplate is not used directly, but is used to populate the GroupsString parameter via RJ Portal Customization

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GroupsString



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### UseDisplaynames

$UseDisplayname = $false: GroupsString contains Group object ids, $true: GroupsString contains Group displayNames

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |


[Back to Table of Content](../../README.md)

