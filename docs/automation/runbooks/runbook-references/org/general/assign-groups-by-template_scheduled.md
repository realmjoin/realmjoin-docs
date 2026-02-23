---
title: Assign Groups By Template (Scheduled)
description: Assign cloud-only groups to many users based on a predefined template
---

## Description
This runbook adds users from a source group to one or more target groups.
Target groups are provided via a template-driven string and can be resolved by group ID or display name.

## Location
Organization → General → Assign Groups By Template_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - Group.ReadWrite.All


## Parameters
### SourceGroupId

Object ID of the source group containing users to process.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### ExclusionGroupId

Optional object ID of a group whose users are excluded from processing.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GroupsTemplate

Template selector used by the portal to populate the GroupsString parameter.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GroupsString

Comma-separated list of target groups (IDs or display names depending on UseDisplaynames).

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### UseDisplaynames

If set to true, GroupsString contains display names; otherwise it contains object IDs.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

