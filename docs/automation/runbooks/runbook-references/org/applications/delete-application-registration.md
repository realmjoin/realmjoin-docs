---
title: Delete Application Registration
description: Delete an application registration and its service principal
---

## Description
Deletes an application registration from Entra ID together with its service principal. Every group assigned to the application is deleted as well, including groups shared with other applications. Applications that still sign users in stop working immediately.

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

Client ID (appId) of the application registration to delete.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Application (client) ID |



[Back to Runbook Reference overview](../../README.md)

