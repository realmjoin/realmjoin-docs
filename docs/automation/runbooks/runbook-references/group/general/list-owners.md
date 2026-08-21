---
title: List Owners
description: List all owners of an Office 365 group.
---

## Description
This runbook retrieves and lists the owners of the specified group.
It uses Microsoft Graph to query the group and its owners and outputs the results as a table.
Use this to quickly review ownership assignments.

## Location
Group → General → List Owners

**Full Runbook name**

rjgit-group_general_list-owners

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
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

Object ID of the target group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

