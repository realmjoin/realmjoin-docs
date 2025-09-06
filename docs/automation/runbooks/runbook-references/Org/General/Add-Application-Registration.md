# Add Application Registration

Add an application registration to Azure AD

## Description

Add an application registration to Azure AD

## Location

Org &rarr; General &rarr; Add Application Registration

## Permissions

### API Permissions

**Microsoft Graph**
- Application.ReadWrite.All
- RoleManagement.ReadWrite.Directory

## Parameters

### -ApplicationName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -signInAudience

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _AzureADMyOrg_ |
| Required | _false_ |
| Position | _2_ |

### -targetUserId

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |

### -customPermissionRoleName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _4_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _5_ |


