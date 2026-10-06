---
title: Grant Teams User Policies
description: Assign Teams voice and meeting policies to this user
---

## Description
Assigns Teams policies to this user: voice routing, dial plan, calling, IP phone, voicemail, meeting and live event policies. Only the policies you fill in are changed. Enter Global (Org Wide Default) to remove an assignment and fall back to the tenant default.

## Location
User → Phone → Grant Teams User Policies

**Full Runbook name**

rjgit-user_phone_grant-teams-user-policies

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
  - *Required to assign Teams policies to the user via the Grant-Cs policy cmdlets*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

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

### OnlineVoicemailPolicy

Voicemail policy to assign. Leave empty to keep the current one, or enter Global (Org Wide Default) to reset it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Voicemail policy |

### TeamsMeetingPolicy

Meeting policy to assign. Leave empty to keep the current one, or enter Global (Org Wide Default) to reset it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Meeting policy |

### TeamsMeetingBroadcastPolicy

Live event (meeting broadcast) policy to assign. Leave empty to keep the current one, or enter Global (Org Wide Default) to reset it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Live event policy |



[Back to Runbook Reference overview](../../README.md)

