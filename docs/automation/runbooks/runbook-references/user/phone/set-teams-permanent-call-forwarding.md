---
title: Set Teams Permanent Call Forwarding
description: Forward this user's calls immediately or turn forwarding off
---

## Description
Sets up immediate call forwarding for this Teams Enterprise Voice user to another Teams user, a phone number, voicemail or the user's own delegates. It can also switch immediate forwarding off again. Unanswered-call handling is turned off at the same time.

## Location
User → Phone → Set Teams Permanent Call Forwarding

**Full Runbook name**

rjgit-user_phone_set-teams-permanent-call-forwarding

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
  - *Required to read and set immediate call forwarding via Get-/Set-CsUserCallingSettings*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### ForwardTargetPhoneNumber

Number that receives the calls, in E.164 format such as +49123456789.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ForwardTargetTeamsUser

Colleague whose Teams account rings instead of this user's.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ForwardToVoicemail

Sends the calls to voicemail. Set by the "Forward calls to" choice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ForwardToDelegates

Sends the calls to the delegates the user has defined in Teams. Set by the "Forward calls to" choice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### TurnOffForward

Switches immediate forwarding off. Set by the "Forward calls to" choice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

