---
title: Archive Team
description: Archive a team
---

## Description
This runbook archives a Microsoft Teams team backed by the specified Microsoft 365 group.
It verifies that the group is provisioned as a team and then triggers the archive action via Microsoft Graph.
Use this to decommission inactive teams while preserving their contents for review.

## Location
Group → Teams → Archive Team

**Full Runbook name**

rjgit-group_teams_archive-team

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - TeamSettings.ReadWrite.All
    - *Reads the team's archive state and calls /teams/{id}/archive*
  - Group.Read.All
    - *Reads the group via /groups/{id} to verify it is a Teams-provisioned group*


## Parameters
### GroupID

Object ID of the Microsoft 365 group that backs the team.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

