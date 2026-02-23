---
title: Assign Groups By Template
description: Assign cloud-only groups to a user based on a template
---

## Description
Adds a user to one or more Entra ID groups using either group object IDs or display names. The list of groups is typically provided via runbook customization templates.

## Location
User → General → Assign Groups By Template

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All


## Parameters
### UserId

ID of the target user in Microsoft Graph.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### GroupsTemplate

Template selector used by portal customization to populate the group list.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GroupsString

Comma-separated list of group object IDs or group display names.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### UseDisplaynames

If set to true, treats values in GroupsString as group display names instead of IDs.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

