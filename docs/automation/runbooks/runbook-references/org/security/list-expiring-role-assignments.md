---
title: List Expiring Role Assignments
description: List Azure AD role assignments expiring within a given number of days
---

## Description
Lists active and PIM-eligible Azure AD role assignments that expire within a specified number of days. The output includes role name, principal, and expiration date.

## Location
Organization → Security → List Expiring Role Assignments

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All
  - RoleManagement.Read.All


## Parameters
### Days

Maximum number of days until expiry.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |



[Back to Runbook Reference overview](../../README.md)

