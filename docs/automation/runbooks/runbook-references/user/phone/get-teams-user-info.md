---
title: Get Teams User Info
description: Show the Teams voice setup of this user
---

## Description
Shows the telephony setup of this user in Teams: the assigned phone number, call forwarding, voicemail, the assigned voice policies and call queue membership. Nothing is changed.

## Location
User → Phone → Get Teams User Info

**Full Runbook name**

rjgit-user_phone_get-teams-user-info

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.3 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>MicrosoftTeams (>= 7.9.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All
    - *Required by the app-based Teams PowerShell sign-in to read tenant information*

### RBAC roles
- Teams Administrator
  - *Required to read user, calling, voicemail and call queue settings via the Cs cmdlets*


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

