---
title: Add Or Remove Nested Group
description: Add/remove a nested group to/from a group
---

## Description
This runbook adds a nested group to a target group or removes an existing nesting.
It supports Microsoft Entra ID groups and Exchange Online distribution or mail-enabled security groups.
Use the Remove switch to remove the nested group instead of adding it.

## Location
Group → General → Add Or Remove Nested Group

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - Group.ReadWrite.All
  - GroupMember.ReadWrite.All


## Parameters
### GroupID

Object ID of the target group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### NestedGroupID

Object ID of the group to add as a nested member.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

Set to true to remove the nested group membership, or false to add it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

