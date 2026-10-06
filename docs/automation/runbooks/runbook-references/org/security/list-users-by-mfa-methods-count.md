---
title: List Users By MFA Methods Count
description: List users by how many MFA methods they registered
---

## Description
Counts the registered authentication methods of every enabled user and lists the users whose count falls into the chosen range, for example those with no MFA method at all. The list in the Output Data tab shows display name, sign-in name and the number of methods. Nothing is changed.

## Location
Organization → Security → List Users By MFA Methods Count

**Full Runbook name**

rjgit-org_security_list-users-by-MFA-methods-count

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
    - *Lists all enabled users to build the set of accounts to check*
  - UserAuthenticationMethod.Read.All
    - *Counts each user's registered MFA methods via /users/{id}/authentication/methods*


## Parameters
### mfaMethodsRange

No methods lists users without any registered method; the other ranges list users with that many registered methods.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Number of MFA methods |

**Portal options**

| Portal option | Value |
| --- | --- |
| No methods (no MFA) | 0 |
| 1 to 3 methods | 1-3 |
| 4 to 5 methods | 4-5 |
| 6 or more methods | 6+ |



[Back to Runbook Reference overview](../../README.md)

