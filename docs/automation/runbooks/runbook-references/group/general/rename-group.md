---
title: Rename Group
description: Rename a group.
---

## Description
This runbook updates a group's DisplayName, MailNickname, and Description.
It does not change the group's email addresses.
Provide only the fields you want to update; empty values are ignored.

## Location
Group → General → Rename Group

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All


## Parameters
### GroupId

Object ID of the group to update.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DisplayName

New display name for the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### MailNickname

New mail nickname (alias) for the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Description

New description for the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

