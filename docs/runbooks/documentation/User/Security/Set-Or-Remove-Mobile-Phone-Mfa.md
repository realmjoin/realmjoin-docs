# Set Or Remove Mobile Phone Mfa

Add, update or remove a user's mobile phone MFA information.

## Description

Add, update or remove a user's mobile phone MFA information.

## Location

User &rarr; Security &rarr; Set Or Remove Mobile Phone Mfa

## Permissions

### API Permissions

**Microsoft Graph**
- UserAuthenticationMethod.ReadWrite.All

## Parameters

### -UserName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -phoneNumber

**Description:** Needs to be in '+###########' syntax 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -Remove

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _3_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _4_ |


