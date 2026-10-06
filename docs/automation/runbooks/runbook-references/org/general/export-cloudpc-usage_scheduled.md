---
title: Export Cloudpc Usage (Scheduled)
description: Write daily Windows 365 usage data to an Azure table
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Collects how the Windows 365 Cloud PCs were used, based on the remote connection reports of the chosen number of past days. The figures are written to an Azure Table so they can be tracked over time. The table is created when missing, and records for the same day are updated rather than duplicated.

## Location
Organization → General → Export Cloudpc Usage (Scheduled)

**Full Runbook name**

rjgit-org_general_export-cloudpc-usage_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Az.Storage (>= 9.7.2) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - CloudPC.Read.All
    - *Lists all Cloud PCs and pulls their remote connection historical reports*
  - Organization.Read.All
    - *Reads /organization to use the tenant id as storage table partition key*

### Permission notes
Azure IaaS: `Contributor` role on the Azure Storage Account used for storing CloudPC usage data


## Parameters
### Table

Table in the storage account the usage data is written to. Created when it does not exist yet.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | CloudPCUsageV2 |
| Type | String |
| Portal display name | Table name |

### ResourceGroupName

Resource group that holds the storage account.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Resource group |

### StorageAccountName

Storage account that holds the table.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Storage account |

### Days

Usage of the past this many days is collected; days already in the table are updated, not added again.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |
| Portal display name | Days to look back |



[Back to Runbook Reference overview](../../README.md)

