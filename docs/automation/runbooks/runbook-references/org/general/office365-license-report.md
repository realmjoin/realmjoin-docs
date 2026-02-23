---
title: Office365 License Report
description: Generate an Office 365 licensing report
---

## Description
This runbook creates a licensing report based on Microsoft 365 subscription SKUs and optionally includes Exchange Online related reports.
It can export the results to Azure Storage and generate SAS links for downloads.

## Location
Organization → General → Office365 License Report

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Reports.Read.All
  - Directory.Read.All
  - User.Read.All


## Parameters
### printOverview

If set to true, prints a short license usage overview.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### includeExhange

If set to true, includes Exchange Online related reports.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### exportToFile

If set to true, exports reports to Azure Storage when configured.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### exportAsZip

If set to true, exports reports as a single ZIP file.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### produceLinks

If set to true, creates SAS tokens/links for exported artifacts.

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
| Default Value | rjrb-licensing-report-v2 |
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

