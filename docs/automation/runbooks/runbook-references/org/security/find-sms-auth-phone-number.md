---
title: Find SMS Auth Phone Number
description: Find the user who holds an SMS sign-in phone number
---

## Description
Finds the user who has a given phone number registered for SMS sign-in in Entra ID. Such numbers must be unique in the tenant, so registering the same number for another user fails until the first registration is removed. Nothing is changed.

## Location
Organization → Security → Find SMS Auth Phone Number

**Full Runbook name**

rjgit-org_security_find-SMS-auth-phone-number

## Details

| Property | Value |
| --- | --- |
| Version | 1.3.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - AuditLog.Read.All
    - *Queries userRegistrationDetails to pre-filter users with a registered mobile phone method*
  - User.Read.All
    - *Reads the matched user's accountEnabled state for the report*
  - UserAuthenticationMethod.Read.All
    - *Batch-reads the users' phoneMethods to compare numbers and check the SMS sign-in state*


## Parameters
### PhoneNumber

Number in international format without spaces, for example +492349876543.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Phone number |



[Back to Runbook Reference overview](../../README.md)

