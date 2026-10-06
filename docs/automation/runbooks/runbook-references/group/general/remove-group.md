---
title: Remove Group
description: Delete this group and its Microsoft 365 resources
---

## Description
Deletes this group. For a Microsoft 365 group this also removes the Teams team and the SharePoint site that belong to it, including their content. The group and its content can be restored from the deleted groups for 30 days, after that they are gone.

## Location
Group → General → Remove Group

**Full Runbook name**

rjgit-group_general_remove-group

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All
    - *Verifies the group exists and deletes it via DELETE /groups/{id}*


## Parameters
### GroupId

Object ID of the group the runbook acts on. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

