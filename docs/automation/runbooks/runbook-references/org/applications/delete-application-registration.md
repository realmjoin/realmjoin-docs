---
title: Delete Application Registration
description: Delete an application registration from Azure AD
---

## Description
This script safely removes an application registration and its associated service principal from Azure Active Directory (Entra ID).

This script is the counterpart to the add-application-registration script and ensures
proper cleanup of all resources created during application registration.

## Location
Organization → Applications → Delete Application Registration

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Application.ReadWrite.OwnedBy
  - Group.ReadWrite.All

### RBAC roles
- Application Developer


## Parameters
### ClientId



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

