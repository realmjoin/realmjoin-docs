---
title: List Inactive Devices
description: List or export inactive devices with no recent logon or Intune sync
---

## Description
Collects devices based on either last interactive sign-in or last Intune sync date and lists them in the console. Optionally exports the results to a CSV file in Azure Storage.

## Location
Organization → Security → List Inactive Devices

**Full Runbook name**

rjgit-org_security_list-inactive-devices

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Az.Storage (>= 9.7.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
    - *Lists devices without recent Intune sync when checking by sync date*
  - Directory.Read.All
    - *Reads owner user details to enrich each stale device*
  - Device.Read.All
    - *Lists Entra devices by last sign-in date and reads their registered owners*


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
| Portal display name | Last Login or Last Intune Sync |

**Portal options**

| Portal option | Value |
| --- | --- |
| Show by Last Intune Sync |  |
| Show by Last Login |  |

### ExportToFile

If set to true, exports the results to a CSV file in Azure Storage.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

**Portal options**

| Portal option | Value |
| --- | --- |
| Export to a CSV file |  |
| List in Console |  |

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

