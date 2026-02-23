---
title: Export All Autopilot Devices
description: List or export all Windows Autopilot devices
---

## Description
Lists all Windows Autopilot devices and optionally exports them to a CSV file in Azure Storage. If exporting is enabled, the runbook uploads the report and returns a time-limited SAS (download) link.

## Location
Organization → General → Export All Autopilot Devices

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
  - Directory.Read.All
  - Device.Read.All


## Parameters
### ExportToFile

"List in Console" (final value: $false) or "Export to a CSV file" (final value: $true) can be selected as action to perform.

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

