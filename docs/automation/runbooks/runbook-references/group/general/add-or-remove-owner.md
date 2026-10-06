---
title: Add Or Remove Owner
description: Add an owner to this group or remove one
---

## Description
Makes a user an owner of this group or removes an existing owner. For Microsoft 365 groups a new owner is also made a member.

## Location
Group → General → Add Or Remove Owner

**Full Runbook name**

rjgit-group_general_add-or-remove-owner

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.3 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
    - *Resolves the target user to verify existence and report the UPN*
  - Group.ReadWrite.All
    - *Reads the group and adds or removes owners via /groups/{id}/owners/$ref*
  - GroupMember.ReadWrite.All
    - *Adds a newly appointed owner as group member*
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Runs the distribution group owner cmdlets in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session changing distribution group owners*


## Parameters
### GroupID

Object ID of the group the runbook acts on. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### UserId

User who gets or loses the ownership.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove

Add makes the user an owner. Remove takes the user off the owner list.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add user as owner | false |
| Remove user as owner | true |



[Back to Runbook Reference overview](../../README.md)

