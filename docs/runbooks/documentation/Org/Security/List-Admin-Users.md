# List Admin Users

List AzureAD role holders and their MFA state.

## Description

Will list users and service principals that hold a builtin AzureAD role.
Admins will be queried for valid MFA methods.

## Location

Org &rarr; Security &rarr; List Admin Users

## Notes

Permissions: MS Graph
- User.Read.All
- Directory.Read.All
- RoleManagement.Read.All

## Permissions

### API Permissions

**Microsoft Graph**
- User.Read.All
- Directory.Read.All
- RoleManagement.Read.All

## Parameters

### -exportToFile

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _1_ |

### -ContainerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _2_ |

### -ResourceGroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |

### -StorageAccountName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _4_ |

### -StorageAccountLocation

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _5_ |

### -StorageAccountSku

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _6_ |

### -QueryMfaState

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _7_ |

### -TrustEmailMfa

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _8_ |

### -TrustPhoneMfa

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _9_ |

### -TrustSoftwareOathMfa

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _10_ |

### -TrustWinHelloMFA

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _11_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _12_ |


