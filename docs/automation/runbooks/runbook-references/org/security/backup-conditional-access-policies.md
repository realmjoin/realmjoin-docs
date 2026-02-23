---
title: Backup Conditional Access Policies
description: Export Conditional Access policies to an Azure Storage account
---

## Description
Exports the current set of Conditional Access policies via Microsoft Graph and uploads them as a ZIP archive to Azure Storage. If no container name is provided, a date-based name is generated.

## Location
Organization → Security → Backup Conditional Access Policies

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Policy.Read.All

### Permission notes
Azure IaaS: Access to the given Azure Storage Account / Resource Group


## Parameters
### ContainerName

Name of the Azure Storage container; if omitted, a default name is generated.

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

