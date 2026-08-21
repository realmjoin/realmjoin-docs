---
title: List Users By MFA Methods Count
description: Report users by the count of their registered MFA methods
---

## Description
This Runbook retrieves a list of users from Azure AD and counts their registered MFA authentication methods.
As a dropdown for the MFA methods count range, you can select from "0 methods (no MFA)", "1-3 methods", "4-5 methods", or "6+ methods".
The output includes the user display name, user principal name, and the count of registered MFA methods.

## Location
Organization → Security → List Users By MFA Methods Count

**Full Runbook name**

rjgit-org_security_list-users-by-MFA-methods-count

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
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

Range for filtering users based on the count of their registered MFA methods.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Select MFA Methods Count Range |

**Portal options**

| Portal option | Value |
| --- | --- |
| Users with 0 methods (no MFA) | 0 |
| Users with 1-3 methods | 1-3 |
| Users with 4-5 methods | 4-5 |
| Users with 6+ methods | 6+ |



[Back to Runbook Reference overview](../../README.md)

