# Reset Password

Reset a user's password.

## Description

Reset a user's password. The user will have to change it on signin. Does not work with PW writeback to onprem AD.

## Location

User &rarr; Security &rarr; Reset Password

## Permissions

### Required Roles

- User administrator

## Parameters

### -UserName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -EnableUserIfNeeded

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _2_ |

### -ForceChangePasswordNextSignIn

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


