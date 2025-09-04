# Set Teams Permanent Call Forwarding

Set up immediate call forwarding for a Microsoft Teams Enterprise Voice user.

## Description

Set up instant call forwarding for a Microsoft Teams Enterprise Voice user. Forwarding to another Microsoft Teams Enterprise Voice user or to an external phone number.

## Location

User &rarr; Phone &rarr; Set Teams Permanent Call Forwarding

## Permissions

### API Permissions

**Microsoft Graph**
- Organization.Read.All

### Required Roles

- Teams Administrator

## Parameters

### -UserName

**Description:** User which should be set up. Could be filled with the user picker in the UI. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -ForwardTargetPhoneNumber

**Description:** Phone number to which calls should be forwarded. Must be in E.164 format (e.g. +49123456789). 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _2_ |

### -ForwardTargetTeamsUser

**Description:** Teams user to which calls should be forwarded. Could be filled with the user picker in the UI. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |

### -ForwardToVoicemail

**Description:** Forward calls to voicemail. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _4_ |

### -ForwardToDelegates

**Description:** Forward calls to delegates which are defined by the user. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _5_ |

### -TurnOffForward

**Description:** Turn off immediate call forwarding. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
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


