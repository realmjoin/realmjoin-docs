---
title: Export Non Compliant Devices
description: Export non-compliant Intune devices and settings
---

## Description
This runbook queries Intune for non-compliant and in-grace-period devices and retrieves detailed policy and setting compliance data.
It can export the results to CSV with SAS (download) links.

## Location
Organization → General → Export Non Compliant Devices

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementConfiguration.Read.All

### Permission notes
Azure IaaS: Access to create/manage Azure Storage resources if producing links


## Parameters
### produceLinks

If set to true, uploads artifacts and produces SAS (download) links when storage settings are available.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ContainerName

Storage container name used for uploads.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjrb-device-compliance-report-v2 |
| Type | String |

### ResourceGroupName

Resource group that contains the storage account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountName

Storage account name used for uploads.

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

### SubscriptionId

Azure subscription ID used for storage operations.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

