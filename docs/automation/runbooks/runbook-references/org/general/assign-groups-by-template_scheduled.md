---
title: Assign Groups By Template (Scheduled)
description: Assign cloud-only groups to many users based on a predefined template.
---

## Description
Assign cloud-only groups to many users based on a predefined template.

## Location
Organization → General → Assign Groups By Template_Scheduled

## Parameters
### SourceGroupId



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### ExclusionGroupId



| Property | Value |
| --- | --- |
| Required | false |
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



[Back to Runbook Reference overview](../../README.md)

