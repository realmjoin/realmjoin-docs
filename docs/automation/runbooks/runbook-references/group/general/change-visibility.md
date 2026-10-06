---
title: Change Visibility
description: Make this group public or private
---

## Description
Switches this Microsoft 365 group between public and private. Public groups can be found and joined by anyone in the organization, private groups only by their members. Membership, owners and email addresses stay as they are.

## Location
Group → General → Change Visibility

**Full Runbook name**

rjgit-group_general_change-visibility

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All
    - *Reads the group and patches its visibility to Public or Private*


## Parameters
### GroupID

Object ID of the group the runbook acts on. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Public

Public groups can be found and joined by anyone in the organization, private groups only by their members.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Visibility |

**Portal options**

| Portal option | Value |
| --- | --- |
| Make group private | false |
| Make group public | true |



[Back to Runbook Reference overview](../../README.md)

