---
title: Check Assignments Of Users
description: Show which Intune policies and apps target given users
---

## Description
Lists the Intune policies, and optionally the apps, that apply to one or more users by resolving their group memberships, nested groups included, and matching them against the assignments. Nothing is changed.

## Location
Organization → General → Check Assignments Of Users

**Full Runbook name**

rjgit-org_general_check-assignments-of-users

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
    - *Resolves each UPN to a user id and lists /users/{id}/transitiveMemberOf*
  - Group.Read.All
    - *Reads the group objects returned by transitiveMemberOf to match assignment targets*
  - DeviceManagementConfiguration.Read.All
    - *Lists Intune configuration, group policy and compliance policies and their assignments*
  - DeviceManagementApps.Read.All
    - *Lists mobile apps and their assignments when IncludeApps is enabled*


## Parameters
### UserPrincipalName

Each picked user is checked separately through their group memberships, nested groups included.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String[] |
| Portal display name | Users |

### IncludeApps

Also lists the apps assigned to the users.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include app assignments? |



[Back to Runbook Reference overview](../../README.md)

