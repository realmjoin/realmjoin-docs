---
title: List Expiring Role Assignments
description: List Entra ID role assignments that expire soon
---

## Description
Lists the active and PIM eligible Entra ID role assignments that expire within the chosen number of days, so they can be renewed in time. Each entry shows the role, the principal and the expiry date. Nothing is changed.

## Location
Organization → Security → List Expiring Role Assignments

**Full Runbook name**

rjgit-org_security_list-expiring-role-assignments

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - RoleManagement.Read.All
    - *Reads role assignment schedules, eligibility schedules and role definitions*
  - User.Read.All
    - *Resolves each assignment's principal to a UPN via /users/{principalId}*


## Parameters
### Days

Assignments that expire within this many days are listed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |
| Portal display name | Expiring within (days) |



[Back to Runbook Reference overview](../../README.md)

