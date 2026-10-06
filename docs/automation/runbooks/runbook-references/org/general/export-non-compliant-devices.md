---
title: Export Non Compliant Devices
description: Export non-compliant Intune devices with their failing settings
---

## Description
Lists the Intune devices that are non-compliant or in a grace period, together with the policies and the individual settings that fail on each of them. The results can be exported as CSV files to an Azure Storage account with time-limited download links. Nothing is changed.

## Location
Organization → General → Export Non Compliant Devices

**Full Runbook name**

rjgit-org_general_export-non-compliant-devices

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementConfiguration.Read.All
    - *Pulls per-device policy and setting compliance via the Intune compliance report endpoints*
  - DeviceManagementManagedDevices.Read.All
    - *Lists non-compliant Intune devices via /deviceManagement/managedDevices*

### Permission notes
Azure IaaS: Access to create/manage Azure Storage resources if producing links


## Parameters
### produceLinks

Uploads the CSV files to the storage account configured in the tenant settings and returns download links.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ContainerName

Storage container the report files are uploaded to. Taken from the tenant setting IntuneDevicesReport.Container.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjrb-device-compliance-report-v2 |
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

### SubscriptionId

Azure subscription that holds the storage account. Taken from the tenant setting IntuneDevicesReport.SubscriptionId.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

