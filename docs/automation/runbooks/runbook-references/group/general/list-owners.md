---
title: List Owners
description: List the owners of this group
---

## Description
Shows the owners of this group as a table. Nothing is changed.

## Location
Group → General → List Owners

**Full Runbook name**

rjgit-group_general_list-owners

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.Read.All
    - *Reads the group and lists its owners via /groups/{id}/owners*
  - User.Read.All
    - *Reads the owners' user properties (display name, UPN) returned by /groups/{id}/owners*


## Parameters
### GroupID

Object ID of the group the runbook acts on. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

