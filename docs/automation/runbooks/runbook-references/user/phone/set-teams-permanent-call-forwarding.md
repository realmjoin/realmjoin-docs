---
title: Set Teams Permanent Call Forwarding
description: Set up immediate call forwarding for a Microsoft Teams Enterprise Voice user.
---

## Description
Set up instant call forwarding for a Microsoft Teams Enterprise Voice user. Forwarding to another Microsoft Teams Enterprise Voice user or to an external phone number.

## Location
User → Phone → Set Teams Permanent Call Forwarding

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All

### RBAC roles
- Teams Administrator


## Parameters
### UserName

User which should be set up. Could be filled with the user picker in the UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### ForwardTargetPhoneNumber

Phone number to which calls should be forwarded. Must be in E.164 format (e.g. +49123456789).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ForwardTargetTeamsUser

Teams user to which calls should be forwarded. Could be filled with the user picker in the UI.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ForwardToVoicemail

Forward calls to voicemail.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ForwardToDelegates

Forward calls to delegates which are defined by the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### TurnOffForward

Turn off immediate call forwarding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |


[Back to Table of Content](../../README.md)

