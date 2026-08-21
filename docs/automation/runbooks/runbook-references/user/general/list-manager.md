---
title: List Manager
description: List manager information for this user
---

## Description
Retrieves the manager object for a specified user. Outputs common manager attributes such as display name, email, and phone numbers.

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

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

