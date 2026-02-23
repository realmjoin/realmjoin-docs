---
title: List Inactive Users
description: List users with no recent interactive sign-ins
---

## Description
Lists users and guests that have not signed in interactively for a specified number of days. Optionally includes accounts that never signed in and accounts that are blocked.

## Location
Organization → Security → List Inactive Users

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

### ShowBlockedUsers

If set to true, includes users and guests that cannot sign in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ShowUsersThatNeverLoggedIn

If set to true, includes users and guests that never signed in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

