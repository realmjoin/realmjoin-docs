---
title: Rename Group
description: Rename this group or change its description
---

## Description
Updates the display name, the mail nickname and the description of this group. Fill in only the fields you want to change; empty fields are left as they are. The group's email addresses do not change.

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

Object ID of the group the runbook acts on. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### DisplayName

New name of the group, for a team also the team name. Leave empty to keep the current name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | New display name |

### MailNickname

New alias (mail nickname) of the group. The existing email addresses stay. Leave empty to keep the current alias.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | New mail nickname |

### Description

New description shown for the group. Leave empty to keep the current one.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | New description |



[Back to Runbook Reference overview](../../README.md)

