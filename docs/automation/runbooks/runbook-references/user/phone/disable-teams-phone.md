---
title: Disable Teams Phone
description: Remove Teams phone number and voice policies from this user
---

## Description
Takes the assigned phone number away from this user and clears the Teams voice policies, so the user can no longer make or receive phone calls through Teams.

## Location
User → Phone → Disable Teams Phone

**Full Runbook name**

rjgit-user_phone_disable-teams-phone

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>MicrosoftTeams (>= 7.9.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All
    - *Required by the app-based Teams PowerShell sign-in to read tenant information*

### RBAC roles
- Teams Administrator
  - *Required to remove the phone number assignment and reset voice policies via the Cs cmdlets*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

