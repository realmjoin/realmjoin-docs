---
title: Grant Teams User Policies
description: Grant specific Microsoft Teams policies to a Microsoft Teams enabled user.
---

## Description
Grant specific Microsoft Teams policies to a Microsoft Teams enabled user.
If the policy name of a policy is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

## Location
User → Phone → Grant Teams User Policies

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All

### RBAC roles
- Teams Administrator


## Parameters
### UserName

User which should be granted the policies. Could be filled with the user picker in the UI.

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

Microsoft Teams Tenant Dial Plan Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

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

Microsoft Teams IP-Phone Policy Name (a.o. for Common Area Phone Users). If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### OnlineVoicemailPolicy

Microsoft Teams Online Voicemail Policy Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### TeamsMeetingPolicy

Microsoft Teams Meeting Policy Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### TeamsMeetingBroadcastPolicy

Microsoft Teams Meeting Broadcast Policy Name (Live Event Policy). If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |


[Back to Table of Content](../../README.md)

