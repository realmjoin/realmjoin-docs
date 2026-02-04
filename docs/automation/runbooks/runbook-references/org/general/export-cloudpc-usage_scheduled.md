---
title: Export Cloudpc Usage (Scheduled)
description: Write daily Windows 365 Utilization Data to Azure Tables
---

## Description
Write daily Windows 365 Utilization Data to Azure Tables. Will write data about the last full day.

## Location
Organization → General → Export Cloudpc Usage_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - CloudPC.Read.All

### Permission notes
Azure IaaS: `Contributor` role on the Azure Storage Account used for storing CloudPC usage data


## Parameters
### Table

CallerName is tracked purely for auditing purposes

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | CloudPCUsageV2 |
| Type | String |

### ResourceGroupName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### StorageAccountName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### days



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |


[Back to Table of Content](../../README.md)

