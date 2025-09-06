# Export Cloudpc Usage_Scheduled

Write daily Windows 365 Utilization Data to Azure Tables

## Description

Write daily Windows 365 Utilization Data to Azure Tables. Will write data about the last full day.

## Location

Org &rarr; General &rarr; Export Cloudpc Usage_Scheduled

## Permissions

### API Permissions

**Microsoft Graph**
- CloudPC.Read.All

### Manual Permissions

- Azure IaaS: `Contributor` role on the Azure Storage Account used for storing CloudPC usage data

## Parameters

### -Table

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _CloudPCUsageV2_ |
| Required | _false_ |
| Position | _1_ |

### -ResourceGroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -StorageAccountName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _3_ |

### -days

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _2_ |
| Required | _false_ |
| Position | _4_ |

### -CallerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _5_ |


