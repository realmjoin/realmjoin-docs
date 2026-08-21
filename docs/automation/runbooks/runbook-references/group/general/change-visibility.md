---
title: Change Visibility
description: Change a group's visibility
---

## Description
This runbook changes the visibility of a Microsoft 365 group between Private and Public.
Set the Public switch to make the group public; otherwise it will be set to private.
This does not change group membership, owners, or email addresses.

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

Object ID of the target group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Public

"Make group private" (final value: $false) or "Make group public" (final value: $true) can be selected as action to perform.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Set Group visibility |

**Portal options**

| Portal option | Value |
| --- | --- |
| Make group private | false |
| Make group public | true |



[Back to Runbook Reference overview](../../README.md)

