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

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All


## Parameters
### GroupID

Object ID of the target group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Public

"Make group private" (final value: $false) or "Make group public" (final value: $true) can be selected as action to perform.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

