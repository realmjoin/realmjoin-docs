---
title: Export Cloudpc Usage (Scheduled)
description: Write daily Windows 365 utilization data to Azure Table Storage
---

## Description
Collects Windows 365 Cloud PC remote connection usage for the last full day and writes it to an Azure Table. The runbook creates the table if needed and merges records per tenant and timestamp.

## Location
Organization → General → Export Cloudpc Usage (Scheduled)

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - CloudPC.Read.All

### Permission notes
Azure IaaS: `Contributor` role on the Azure Storage Account used for storing CloudPC usage data


## Parameters
### Table

Name of the Azure Table Storage table to write to.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | CloudPCUsageV2 |
| Type | String |

### ResourceGroupName

Name of the Azure Resource Group containing the Storage Account.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### StorageAccountName

Name of the Azure Storage Account hosting the table.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Days

Number of days to look back when collecting usage data.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |



[Back to Runbook Reference overview](../../README.md)

