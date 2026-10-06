---
title: Backup Conditional Access Policies
description: Back up all Conditional Access policies to Azure Storage
---

## Description
Exports every Conditional Access policy of the tenant as JSON and uploads them as one ZIP archive to an Azure Storage account. The backup lets you compare or restore policies later. Without a container name, a container named after the current date is used. Nothing is changed in the tenant.

## Location
Organization → Security → Backup Conditional Access Policies

**Full Runbook name**

rjgit-org_security_backup-conditional-access-policies

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Az.Storage (>= 9.7.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Policy.Read.All
    - *Fetches all Conditional Access policies to export them as JSON files*

### Permission notes
Azure IaaS: Access to the given Azure Storage Account / Resource Group


## Parameters
### ContainerName

Storage container the archive is uploaded to. Taken from the tenant setting CaPoliciesExport.Container; empty means a container named after the current date.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group of the storage account. Taken from the tenant setting CaPoliciesExport.ResourceGroup.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account for the backup. Taken from the tenant setting CaPoliciesExport.StorageAccount.Name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountLocation

Azure region used when the storage account has to be created. Taken from the tenant setting CaPoliciesExport.StorageAccount.Location.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountSku

Performance tier used when the storage account has to be created. Taken from the tenant setting CaPoliciesExport.StorageAccount.Sku.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

