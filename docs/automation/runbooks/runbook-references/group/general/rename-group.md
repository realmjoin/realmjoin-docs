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

**Full Runbook name**

rjgit-group_general_rename-group

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
    - *Reads the group and patches displayName, mailNickname and description*


## Parameters
### GroupId

Object ID of the group to update.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### DisplayName

New display name for the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | New DisplayName / Team Name |

### MailNickname

New mail nickname (alias) for the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | New MailNickname |

### Description

New description for the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | New Description |



[Back to Runbook Reference overview](../../README.md)

