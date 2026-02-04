---
title: List Inactive Users
description: List users, that have no recent interactive signins.
---

## Description
This runbook lists users and guests from Azure AD, that have not signed in interactively for a specified number of days.
It can also include users/guests that have never logged in.

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

Number of days without interactive signin.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |

### showBlockedUsers

Include users/guests that can not sign in (accountEnabled = false).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### showUsersThatNeverLoggedIn

Beware: This has to enumerate all users / Can take a long time.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |


[Back to Table of Content](../../README.md)

