---
title: Add Security Group
description: Create a Microsoft Entra ID security group
---

## Description
This runbook creates a Microsoft Entra ID security group with membership type Assigned.
It validates the group name and optionally sets an owner during creation.

## Location
Organization → General → Add Security Group

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.Create


## Parameters
### GroupName

Display name of the security group to create.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### GroupDescription

Optional description for the security group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Owner

Optional owner to assign to the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

