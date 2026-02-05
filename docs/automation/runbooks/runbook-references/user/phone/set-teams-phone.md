---
title: Set Teams Phone
description: Assign a phone number to a Microsoft Teams enabled user, enable calling and Grant specific Microsoft Teams policies.
---

## Description
Assign a phone number to a Microsoft Teams enabled user, enable calling and Grant specific Microsoft Teams policies.
If the policy name of a policy is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

## Location
User → Phone → Set Teams Phone

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All

### RBAC roles
- Teams Administrator


## Parameters
### UserName

User which should be assigned. Could be filled with the user picker in the UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### PhoneNumber

Phone number which should be assigned to the user. The number must be in E.164 format (e.g. +49123456789).

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### OnlineVoiceRoutingPolicy

Microsoft Teams Online Voice Routing Policy Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### TenantDialPlan

Microsoft Teams DialPlan Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### TeamsCallingPolicy

Microsoft Teams Calling Policy Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### TeamsIPPhonePolicy

Microsoft Teams IP Phone Policy Name (a.o. for Common Area Phone Users). If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

