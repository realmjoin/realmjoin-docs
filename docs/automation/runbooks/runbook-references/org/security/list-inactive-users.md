---
title: List Inactive Users
description: List users with no recent interactive sign-ins
---

## Description
Lists users and guests that have not signed in interactively for a specified number of days. Optionally includes accounts that never signed in and accounts that are blocked.

## Location
Organization → Security → List Inactive Users

**Full Runbook name**

rjgit-org_security_list-inactive-users

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - AuditLog.Read.All
  - Organization.Read.All


## Parameters
### Days

Number of days without interactive sign-in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |
| Portal display name | Days without signin |

### ShowBlockedUsers

If set to true, includes users and guests that cannot sign in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include users/guests that can not sign in |

### ShowUsersThatNeverLoggedIn

If set to true, includes users and guests that never signed in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include users/guests that never logged in |



[Back to Runbook Reference overview](../../README.md)

