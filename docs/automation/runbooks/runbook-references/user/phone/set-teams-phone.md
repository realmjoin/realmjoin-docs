---
title: Set Teams Phone
description: Assign a phone number and voice policies to this user
---

## Description
Assigns a phone number to this Teams user and optionally sets the voice routing policy, dial plan, calling policy and IP phone policy. Only the policies you fill in are changed. Enter Global (Org Wide Default) to remove an assignment and fall back to the tenant default.

## Location
User → Phone → Set Teams Phone

**Full Runbook name**

rjgit-user_phone_set-teams-phone

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
  - *Required to assign phone numbers and voice policies via Set-CsPhoneNumberAssignment and Grant-Cs cmdlets*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### PhoneNumber

Number to assign, in E.164 format such as +49123456789.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Phone number (E.164, e.g. +49123987654) |

### OnlineVoiceRoutingPolicy

Voice routing policy to assign. Leave empty to keep the current one, or enter Global (Org Wide Default) to reset it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Online voice routing policy |

### TenantDialPlan

Dial plan to assign. Leave empty to keep the current one, or enter Global (Org Wide Default) to reset it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Tenant dial plan |

### TeamsCallingPolicy

Calling policy to assign. Leave empty to keep the current one, or enter Global (Org Wide Default) to reset it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Calling policy |

### TeamsIPPhonePolicy

IP phone policy to assign, typically for common area phones. Leave empty to keep the current one, or enter Global (Org Wide Default) to reset it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | IP phone policy |



[Back to Runbook Reference overview](../../README.md)

