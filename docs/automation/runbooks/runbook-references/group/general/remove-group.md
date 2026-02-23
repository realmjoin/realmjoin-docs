---
title: Remove Group
description: Remove a group. For Microsoft 365 groups, also the associated resources (Teams, SharePoint site) will be removed.
---

## Description
This runbook deletes the specified group, which for Microsoft 365 groups means, that it also deletes the associated resources such as the Teams Team and the SharePoint Site.

## Location
Group → General → Remove Group

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All


## Parameters
### GroupId

Object ID of the group to delete.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

