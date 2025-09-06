# Export Policy Report

Create a report of a tenant's polcies from Intune and AAD and write them to a markdown file.

## Description

## Location

Org &rarr; General &rarr; Export Policy Report

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementConfiguration.Read.All
- Policy.Read.All

### Manual Permissions

- Azure Storage Account: Contributor role on the Storage Account used for exporting reports

## Parameters

### -produceLinks

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _1_ |

### -exportJson

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _2_ |

### -renderLatexPagebreaks

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _3_ |

### -ContainerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _rjrb-licensing-report-v2_ |
| Required | _false_ |
| Position | _4_ |

### -ResourceGroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _5_ |

### -StorageAccountName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _6_ |

### -StorageAccountLocation

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _7_ |

### -StorageAccountSku

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


