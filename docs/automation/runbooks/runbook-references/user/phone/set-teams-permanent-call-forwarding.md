---
title: Set Teams Permanent Call Forwarding
description: Set immediate call forwarding for a Teams user
---

## Description
Configures immediate call forwarding for a Teams Enterprise Voice user to a Teams user, a phone number, voicemail, or the user's delegates. The runbook can also disable immediate forwarding.

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

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### ForwardTargetPhoneNumber

Phone number to which calls should be forwarded. Must be in E.164 format (e.g. +49123456789)

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ForwardTargetTeamsUser

User principal name of the Teams user to forward calls to.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ForwardToVoicemail

If set to true, forwards calls to voicemail.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ForwardToDelegates

If set to true, forwards calls to the delegates defined by the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### TurnOffForward

If set to true, disables immediate call forwarding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

