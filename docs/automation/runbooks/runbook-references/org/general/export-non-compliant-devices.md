---
title: Export Non Compliant Devices
description: Report on non-compliant devices and policies
---

## Description
Report on non-compliant devices and policies

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



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ContainerName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjrb-device-compliance-report-v2 |
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

### SubscriptionId



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |


[Back to Table of Content](../../README.md)

