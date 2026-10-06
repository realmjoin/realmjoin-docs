---
title: Archive Team
description: Archive the team of this group
---

## Description
Archives the Microsoft Teams team that belongs to this Microsoft 365 group. Members can still read the team's content, but nobody can post in its channels until the team is unarchived; files in the SharePoint site stay editable. Use it to retire an inactive team without losing its content. The group must be provisioned as a team.

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

Object ID of the group the runbook acts on. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

