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

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - UserAuthenticationMethod.Read.All


## Parameters
### mfaMethodsRange

Range for filtering users based on the count of their registered MFA methods.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

