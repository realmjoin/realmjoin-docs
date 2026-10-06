---
title: List All Members
description: List all members of this group, nested groups included
---

## Description
Lists every member of this Entra ID group, both direct members and those who belong through nested groups. The result is a CSV-formatted list with the user principal name, whether the membership is direct, and the group path. A path like "Primary, Secondary" means the user is in Primary through the nested group Secondary.

## Location
Group → General → List All Members

**Full Runbook name**

rjgit-group_general_list-all-members

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.3 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.Read.All
    - *Reads the group and pages through its members to resolve nested group membership*
  - User.Read.All
    - *Reads the user members' UPNs to build the membership report*


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

