# Enrolled Devices Report_Scheduled

Show recent first-time device enrollments.

## Description

Show recent first-time device enrollments, grouped by a category/attribute.

## Location

Org &rarr; General &rarr; Enrolled Devices Report_Scheduled

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementServiceConfig.Read.All
- DeviceManagementManagedDevices.Read.All
- User.Read.All
- Device.ReadWrite.All

### Manual Permissions

- Azure: Contributor on Storage Account

## Parameters

### -Weeks

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _4_ |
| Required | _false_ |
| Position | _1_ |

### -dataSource

**Description:** Where to look for a devices "birthday"?
0 - AutoPilot profile assignment date
1 - Intune object creation date 

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _0_ |
| Required | _false_ |
| Position | _2_ |

### -groupingSource

**Description:** How to group results?
0 - no grouping
1 - AzureAD User properties
2 - AzureAD Device properties
3 - Intune device properties
4 - AutoPilot properties 

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _1_ |
| Required | _false_ |
| Position | _3_ |

### -groupingAttribute

**Description:** Examples:

Autopilot:
- "groupTag"
- "systemFamily"
- "skuNumber"

AzureAD User:
- "city"
- "companyName"
- "department"
- "officeLocation"
- "preferredLanguage"
- "state"
- "usageLocation"
- "manager"?

AzureAD Device:
- "manufacturer"
- "model"

Intune Device:
- "isEncrypted" 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _country_ |
| Required | _false_ |
| Position | _4_ |

### -exportCsv

**Description:** Please configure an Azure Storage Account to use this feature. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _5_ |

### -ContainerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _6_ |

### -ResourceGroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _7_ |

### -StorageAccountName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _8_ |

### -StorageAccountLocation

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _9_ |

### -StorageAccountSku

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _10_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _11_ |


