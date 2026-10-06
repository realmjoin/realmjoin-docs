---
title: List Inactive Devices
description: List devices with no recent sign-in or Intune sync
---

## Description
Lists the devices whose last Intune sync, or whose last sign-in recorded in Entra ID, is older than the chosen number of days. The result can be shown in the run output or exported as a CSV file to an Azure Storage account. Nothing is changed.

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

Devices with no sync or sign-in for at least this many days are listed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |

### Sync

Last Intune sync looks at managed devices and their last check-in; Last sign-in looks at Entra ID device objects and their approximate last sign-in date.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Measure inactivity by |

**Portal options**

| Portal option | Value |
| --- | --- |
| Last Intune sync | true |
| Last sign-in | false |

### ExportToFile

List in the run output, or export to a CSV file in the storage account configured in the tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Output |

**Portal options**

| Portal option | Value |
| --- | --- |
| Export to a CSV file | true |
| List in the run output | false |

### ContainerName

Storage container the report files are uploaded to. Taken from the tenant setting InactiveDevices.Container.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group of the storage account. Taken from the tenant setting InactiveDevices.ResourceGroup.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account for the export. Taken from the tenant setting InactiveDevices.StorageAccount.Name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountLocation

Azure region used when the storage account has to be created. Taken from the tenant setting InactiveDevices.StorageAccount.Location.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountSku

Performance tier used when the storage account has to be created. Taken from the tenant setting InactiveDevices.StorageAccount.Sku.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

