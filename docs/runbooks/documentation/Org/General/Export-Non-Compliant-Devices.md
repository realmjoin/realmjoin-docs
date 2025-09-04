# Export Non Compliant Devices

Report on non-compliant devices and policies

## Description

Report on non-compliant devices and policies

## Location

Org &rarr; General &rarr; Export Non Compliant Devices

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementConfiguration.Read.All

### Manual Permissions

- Azure IaaS: Access to create/manage Azure Storage resources if producing links

## Parameters

### -produceLinks

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
| Default Value | _rjrb-device-compliance-report-v2_ |
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

### -SubscriptionId

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _7_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _8_ |


