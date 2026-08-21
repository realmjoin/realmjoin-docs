---
title: Delete Application Registration
description: Delete an application registration from Azure AD
---

## Description
This runbook deletes an application registration and its associated service principal from Microsoft Entra ID.
It verifies that the application exists before deletion and performs a best-effort cleanup of groups assigned during provisioning.

## Location
Organization → Applications → Delete Application Registration

**Full Runbook name**

rjgit-org_applications_delete-application-registration

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Application.ReadWrite.OwnedBy
    - *Looks up the app and service principal by appId and deletes the registration*
  - Group.ReadWrite.All
    - *Deletes the groups that were assigned to the app during provisioning*

### RBAC roles
- Application Developer
  - *Allows deleting app registrations the runbook's identity does not own*


## Parameters
### ClientId

The application client ID (appId) of the application registration to delete.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

