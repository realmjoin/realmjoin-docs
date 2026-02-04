---
title: Export Enterprise Application Users
description: Export a CSV of all (enterprise) application owners and users
---

## Description
This runbook exports a comprehensive list of all enterprise applications (or all service principals)
in your Azure AD tenant along with their owners and assigned users/groups. Afterwards the CSV file is uploaded
to an Azure Storage Account, from where it can be downloaded.

## Location
Organization → Applications → Export Enterprise Application Users

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Directory.Read.All
  - Application.Read.All

### Permission notes
Azure IaaS: - Contributor - access on subscription or resource group used for the export


## Parameters
### entAppsOnly



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

