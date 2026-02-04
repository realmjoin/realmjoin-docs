---
title: Enrolled Devices Report (Scheduled)
description: Show recent first-time device enrollments.
---

## Description
Show recent first-time device enrollments, grouped by a category/attribute.

## Location
Organization → General → Enrolled Devices Report_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.Read.All
  - DeviceManagementManagedDevices.Read.All
  - User.Read.All
  - Device.ReadWrite.All

### Permission notes
Azure: Contributor on Storage Account


## Parameters
### Weeks



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 4 |
| Type | Int32 |

### dataSource

Where to look for a devices "birthday"?
0 - AutoPilot profile assignment date
1 - Intune object creation date

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

### groupingSource

How to group results?
0 - no grouping
1 - AzureAD User properties
2 - AzureAD Device properties
3 - Intune device properties
4 - AutoPilot properties

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |

### groupingAttribute

Examples:

Autopilot:
- "groupTag"
- "systemFamily"
- "skuNumber"

AzureAD User:
- "city"
- "companyName"
- "department"
- "officeLocation"
- "preferredLanguage"
- "state"
- "usageLocation"
- "manager"?

AzureAD Device:
- "manufacturer"
- "model"

Intune Device:
- "isEncrypted"

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | country |
| Type | String |

### exportCsv

Please configure an Azure Storage Account to use this feature.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ContainerName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ResourceGroupName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountLocation



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountSku



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |


[Back to Table of Content](../../README.md)

