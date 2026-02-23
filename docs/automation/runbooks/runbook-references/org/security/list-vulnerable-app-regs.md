---
title: List Vulnerable App Regs
description: List app registrations potentially vulnerable to CVE-2021-42306
---

## Description
Lists Azure AD app registrations that may be affected by CVE-2021-42306 by inspecting stored key credentials. Optionally exports the findings to a CSV file in Azure Storage.

## Location
Organization → Security → List Vulnerable App Regs

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All


## Parameters
### ExportToFile

"List in Console" (final value: $false) or "Export to a CSV file" (final value: $true) can be selected as action to perform. The export saves the findings to a CSV file in Azure Storage.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ContainerName

Name of the Azure Storage container to upload the CSV report to.

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

