---
title: Check Assignments Of Users
description: Check Intune assignments for one or more user principal names
---

## Description
This runbook queries Intune policies and optionally app assignments relevant to the specified user(s).
It resolves transitive group membership and reports matching assignments.

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

User Principal Names of the users to check assignments for.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String[] |
| Portal display name | One or more users to check assignments for |

### IncludeApps

If set to true, also evaluates application assignments.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include app assignments |



[Back to Runbook Reference overview](../../README.md)

