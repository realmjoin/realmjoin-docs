---
title: Disable Teams Phone
description: Microsoft Teams telephony offboarding
---

## Description
Removes the assigned phone number and clears selected Teams voice policies for a Teams-enabled user. This fullfills the telephony offboarding scenarios.

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

User which should be cleared. Could be filled with the user picker in the UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

