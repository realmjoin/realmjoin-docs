---
title: Add Security Group
description: Create a security group in Entra ID
---

## Description
Creates a security group in Entra ID with assigned membership, so it can be used for permissions and access assignments. Names that contain a blocked word or are already in use are rejected. An owner can be set right away.

## Location
Organization → General → Add Security Group

**Full Runbook name**

rjgit-org_general_add-security-group

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | Microsoft.Graph.Authentication (>= 2.39.0)<br>RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.Create
    - *Creates the security group via POST /groups after a duplicate-name check*
  - Group.Read.All
    - *Checks for an existing group with the same display name before creating*


## Parameters
### GroupName

Name shown in Entra ID. Must be unique and must not contain a blocked word.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Group name |

### GroupDescription

Short text that explains what the group is for. Leave empty for none.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Description |

### Owner

User who becomes owner of the group. Leave empty for no owner.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Owner |



[Back to Runbook Reference overview](../../README.md)

