---
title: Export All Autopilot Devices
description: List or export all Windows Autopilot devices
---

## Description
Lists every Windows Autopilot registration with its details, either in the run output or as a CSV file uploaded to an Azure Storage account with a time-limited download link. Nothing is changed.

## Location
Organization → General → Export All Autopilot Devices

**Full Runbook name**

rjgit-org_general_export-all-autopilot-devices

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
    - *Enriches each Autopilot device with Intune data via /deviceManagement/managedDevices*
  - DeviceManagementServiceConfig.Read.All
    - *Lists windowsAutopilotDeviceIdentities as the base data of the export*


## Parameters
### ExportToFile

List in the run output, or export to a CSV file with a download link.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

**Portal options**

| Portal option | Value |
| --- | --- |
| Export to a CSV file | true |
| List in the run output | false |

### ContainerName

Storage container the CSV file is uploaded to. Taken from the tenant setting IntuneDevicesReport.Container.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group of the storage account. Taken from the tenant setting IntuneDevicesReport.ResourceGroup.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account for the export. Taken from the tenant setting IntuneDevicesReport.StorageAccount.Name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountLocation

Azure region used when the storage account has to be created. Taken from the tenant setting IntuneDevicesReport.StorageAccount.Location.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountSku

Performance tier used when the storage account has to be created. Taken from the tenant setting IntuneDevicesReport.StorageAccount.Sku.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

