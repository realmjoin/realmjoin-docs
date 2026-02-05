---
title: Add Security Group
description: This runbook creates a Microsoft Entra ID security group with membership type "Assigned".
---

## Description
This runbook creates a Microsoft Entra ID security group with membership type "Assigned".

## Location
Organization → General → Add Security Group

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.Create


## Parameters
### GroupName

The name of the security group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### GroupDescription

The description of the security group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Owner

The owner of the security group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

