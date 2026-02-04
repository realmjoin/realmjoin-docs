---
title: Export Policy Report
description: Create a report of a tenant's polcies from Intune and AAD and write them to a markdown file.
---

## Location
Organization → General → Export Policy Report

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementConfiguration.Read.All
  - Policy.Read.All

### Permission notes
Azure Storage Account: Contributor role on the Storage Account used for exporting reports


## Parameters
### produceLinks



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### exportJson



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### renderLatexPagebreaks



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ContainerName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjrb-licensing-report-v2 |
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

