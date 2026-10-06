---
title: Add Or Remove Nested Group
description: Add a nested group to this group or remove it
---

## Description
Adds another group as a member of this group, or removes that nesting again. Works for Microsoft Entra ID groups as well as Exchange Online distribution and mail-enabled security groups.

## Location
Group → General → Add Or Remove Nested Group

**Full Runbook name**

rjgit-group_general_add-or-remove-nested-group

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.3 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All
    - *Reads target and nested group and backs the nesting changes*
  - GroupMember.ReadWrite.All
    - *Checks nesting and adds or removes the nested group via /groups/{id}/members/$ref*
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp *(optional — feature: Mail-enabled groups)*
    - *Manages nesting via the Exchange Online distribution group cmdlets*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session managing distribution group nesting*


## Parameters
### GroupID

Object ID of the group the runbook acts on. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### NestedGroupID

Group that becomes a member of this group, or stops being one.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

Add makes the chosen group a member of this group. Remove takes an existing nesting away.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add nested group | false |
| Remove nested group | true |



[Back to Runbook Reference overview](../../README.md)

