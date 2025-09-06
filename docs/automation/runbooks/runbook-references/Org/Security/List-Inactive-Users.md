# List Inactive Users

List users, that have no recent interactive signins.

## Description

List users, that have no recent interactive signins.

## Location

Org &rarr; Security &rarr; List Inactive Users

## Permissions

### API Permissions

**Microsoft Graph**
- User.Read.All
- AuditLog.Read.All
- Organization.Read.All

## Parameters

### -Days

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _30_ |
| Required | _false_ |
| Position | _1_ |

### -showBlockedUsers

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _2_ |

### -showUsersThatNeverLoggedIn

**Description:** Beware: This has to enumerate all users / Can take a long time. 

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


