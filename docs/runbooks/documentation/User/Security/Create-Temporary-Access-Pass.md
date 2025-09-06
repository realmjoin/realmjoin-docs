# Create Temporary Access Pass

Create an AAD temporary access pass for a user.

## Description

Create an AAD temporary access pass for a user.

## Location

User &rarr; Security &rarr; Create Temporary Access Pass

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

### -LifetimeInMinutes

**Description:** Time the pass will stay valid in minutes 

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _240_ |
| Required | _false_ |
| Position | _2_ |

### -OneTimeUseOnly

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
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


