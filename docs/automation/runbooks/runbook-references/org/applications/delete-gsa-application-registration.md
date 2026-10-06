---
title: Delete GSA Application Registration
description: Delete a Global Secure Access application and its access group
---

## Description
Deletes a Global Secure Access application that was created with the Add GSA Application Registration runbook. Its service principal, application segments, connector group assignment and the access group that follows the naming scheme go with it. Before deleting anything it checks that the application really is a GSA or App Proxy application. Other groups assigned to the application are only listed, unless you choose to delete them too.

## Location
Organization → Applications → Delete GSA Application Registration

**Full Runbook name**

rjgit-org_applications_delete-GSA-application-registration

## Details

| Property | Value |
| --- | --- |
| Version | 1.2.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Application.ReadWrite.All
    - *Finds the Global Secure Access app, verifies onPremisesPublishing and deletes it via DELETE /applications/{id}*
  - Group.ReadWrite.All
    - *Finds the app's naming-scheme access groups and deletes assigned or orphaned groups*


## Parameters
### applicationName

Full display name of the application, for example GSA-MyApp.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Application name |

### groupPrefix

Prefix of the access group's naming scheme, the same as in the add runbook. Usually preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | App - Entra - GSA - |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### groupSuffix

Suffix of the access group's naming scheme, if one was used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### deleteAllAssignedGroups

Also deletes every other group assigned to the application. Careful, such groups may be shared with other applications.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Delete all assigned groups? |



[Back to Runbook Reference overview](../../README.md)

