---
title: List Manager
description: Show the manager of this user
---

## Description
Shows who is set as the manager of this user in Entra ID, with the manager's display name, email address and phone numbers. Nothing is changed.

## Location
User → General → List Manager

**Full Runbook name**

rjgit-user_general_list-manager

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
    - *Reads the user and /users/{id}/manager to output the manager's contact details*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

