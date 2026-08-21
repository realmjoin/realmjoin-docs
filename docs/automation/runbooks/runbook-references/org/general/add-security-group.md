---
title: Add Security Group
description: Create a Microsoft Entra ID security group
---

## Description
This runbook creates a Microsoft Entra ID security group with membership type Assigned.
It validates the group name and optionally sets an owner during creation.

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

Display name of the security group to create.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Name of the security group |

### GroupDescription

Optional description for the security group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Description of this security group |

### Owner

Optional owner to assign to the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Owner (optional) |



[Back to Runbook Reference overview](../../README.md)

