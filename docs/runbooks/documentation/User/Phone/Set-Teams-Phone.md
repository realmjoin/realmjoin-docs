# Set Teams Phone

Assign a phone number to a Microsoft Teams enabled user, enable calling and Grant specific Microsoft Teams policies.

## Description

Assign a phone number to a Microsoft Teams enabled user, enable calling and Grant specific Microsoft Teams policies.
If the policy name of a policy is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered.

## Location

User &rarr; Phone &rarr; Set Teams Phone

## Permissions

### API Permissions

**Microsoft Graph**
- Organization.Read.All

### Required Roles

- Teams Administrator

## Parameters

### -UserName

**Description:** User which should be assigned. Could be filled with the user picker in the UI. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -PhoneNumber

**Description:** Phone number which should be assigned to the user. The number must be in E.164 format (e.g. +49123456789). 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -OnlineVoiceRoutingPolicy

**Description:** Microsoft Teams Online Voice Routing Policy Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |

### -TenantDialPlan

**Description:** Microsoft Teams DialPlan Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _4_ |

### -TeamsCallingPolicy

**Description:** Microsoft Teams Calling Policy Name. If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _5_ |

### -TeamsIPPhonePolicy

**Description:** Microsoft Teams IP Phone Policy Name (a.o. for Common Area Phone Users). If the policy name is left blank, the corresponding policy will not be changed. To clear the policies assignment, the value "Global (Org Wide Default)" has to be entered. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _6_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _7_ |


