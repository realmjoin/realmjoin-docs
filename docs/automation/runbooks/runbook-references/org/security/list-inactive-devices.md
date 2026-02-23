---
title: List Inactive Devices
description: List or export inactive devices with no recent logon or Intune sync
---

## Description
Collects devices based on either last interactive sign-in or last Intune sync date and lists them in the console. Optionally exports the results to a CSV file in Azure Storage.

## Location
Organization → Security → List Inactive Devices

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
  - Directory.Read.All
  - Device.Read.All


## Parameters
### Days

Number of days without sync or sign-in used to consider a device inactive.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |

### Sync

If set to true, inactivity is based on last Intune sync; otherwise it is based on last interactive sign-in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ExportToFile

If set to true, exports the results to a CSV file in Azure Storage.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ContainerName

Name of the Azure Storage container to upload the CSV report to.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ResourceGroupName

Name of the Azure Resource Group containing the Storage Account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountName

Name of the Azure Storage Account used for upload.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountLocation

Azure region for the Storage Account if it needs to be created.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountSku

SKU name for the Storage Account if it needs to be created.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

