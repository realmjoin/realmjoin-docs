---
title: Enrolled Devices Report (Scheduled)
description: Show recent first-time device enrollments
---

## Description
This runbook reports recent device enrollments based on a configurable time range.
It can group results by a selected attribute and can optionally export the report as a CSV file.

## Location
Organization → General → Enrolled Devices Report (Scheduled)

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.Read.All
  - DeviceManagementManagedDevices.Read.All
  - User.Read.All
  - Device.ReadWrite.All

### Permission notes
Azure: Contributor on Storage Account


## Parameters
### Weeks

Time range in weeks to include in the report.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 4 |
| Type | Int32 |

### dataSource

Data source used to determine the first enrollment date.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

### groupingSource

Data source used to resolve the grouping attribute.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |

### groupingAttribute

Attribute name used for grouping.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | country |
| Type | String |

### exportCsv

Please configure an Azure Storage Account to use this feature.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ContainerName

Storage container name used for upload.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ResourceGroupName

Resource group that contains the storage account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountName

Storage account name used for upload.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountLocation

Azure region for the storage account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountSku

Storage account SKU.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

