---
title: Get Teams User Info
description: Get Microsoft Teams voice status for a user
---

## Description
Retrieves voice-related status information for a Teams user such as phone number assignment, call forwarding settings, voicemail configuration, and policy assignments. The output is intended for troubleshooting and validation.

## Location
User → Phone → Get Teams User Info

**Full Runbook name**

rjgit-user_phone_get-teams-user-info

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>MicrosoftTeams (>= 7.6.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All

### RBAC roles
- Teams Administrator


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

