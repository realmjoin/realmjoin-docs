# Grant Teams User Policies

Grant specific Microsoft Teams policies to a Microsoft Teams enabled user.

## Description

Grant specific Microsoft Teams policies to a Microsoft Teams enabled user.
If the policy name of a policy is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

## Location

User &rarr; Phone &rarr; Grant Teams User Policies

## Permissions

### API Permissions

**Microsoft Graph**
- Organization.Read.All

### Required Roles

- Teams Administrator

## Parameters

### -UserName

**Description:** User which should be granted the policies. Could be filled with the user picker in the UI. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -OnlineVoiceRoutingPolicy

**Description:** Microsoft Teams Online Voice Routing Policy Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _2_ |

### -TenantDialPlan

**Description:** Microsoft Teams Tenant Dial Plan Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |

### -TeamsCallingPolicy

**Description:** Microsoft Teams Calling Policy Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _4_ |

### -TeamsIPPhonePolicy

**Description:** Microsoft Teams IP-Phone Policy Name (a.o. for Common Area Phone Users). If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _5_ |

### -OnlineVoicemailPolicy

**Description:** Microsoft Teams Online Voicemail Policy Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _6_ |

### -TeamsMeetingPolicy

**Description:** Microsoft Teams Meeting Policy Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _7_ |

### -TeamsMeetingBroadcastPolicy

**Description:** Microsoft Teams Meeting Broadcast Policy Name (Live Event Policy). If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _8_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _9_ |


