---
title: List Inactive Users
description: List users with no recent interactive sign-in
---

## Description
Lists the users and guests whose last interactive sign-in is older than the chosen number of days. Accounts that are blocked from signing in and accounts that never signed in can be included. Nothing is changed.

## Location
Organization → Security → List Inactive Users

**Full Runbook name**

rjgit-org_security_list-inactive-users

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - AuditLog.Read.All
    - *Required to read the signInActivity property on /users*
  - Organization.Read.All
    - *Required by Graph alongside AuditLog.Read.All to expose signInActivity*
  - User.Read.All
    - *Lists all users with UPN, mail, account state and user type*


## Parameters
### Days

Users with no interactive sign-in for at least this many days are listed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |
| Portal display name | Inactive for at least (days) |

### ShowBlockedUsers

Also lists users and guests whose sign-in is blocked.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include blocked accounts? |

### ShowUsersThatNeverLoggedIn

Also lists users and guests that never signed in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include accounts that never signed in? |



[Back to Runbook Reference overview](../../README.md)

