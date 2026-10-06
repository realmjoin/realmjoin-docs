---
title: Export Policy Report
description: Export Intune and Entra ID policies as a Markdown report
---

## Description
Collects the configuration policies from Intune and Entra ID and writes them into one Markdown report, for documentation or review. The raw policy definitions can be exported as JSON as well. The files can be uploaded to an Azure Storage account with time-limited download links. Nothing is changed.

## Location
Organization → General → Export Policy Report

**Full Runbook name**

rjgit-org_general_export-policy-report

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.3 |
| Required modules | Microsoft.Graph.Authentication (>= 2.39.0)<br>RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementConfiguration.Read.All
    - *Reads Intune configuration, compliance and group policy objects incl. assignments and filters*
  - Policy.Read.All
    - *Reads the Conditional Access policies rendered in the report*
  - Directory.Read.All *(optional — feature: Name resolution)*
    - *Resolves group, user, role and application names referenced by policies*

### Permission notes
Azure Storage Account: Contributor role on the Storage Account used for exporting reports


## Parameters
### produceLinks

Uploads the report files to the storage account configured in the tenant settings and returns download links.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### exportJson

Also exports the raw policy definitions as JSON files.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### renderLatexPagebreaks

Adds LaTeX page breaks to the Markdown, so each policy starts on a new page when the Markdown is converted to PDF.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ContainerName

Storage container the report files are uploaded to. Taken from the tenant setting TenantPolicyReport.Container.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjrb-licensing-report-v2 |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group of the storage account. Taken from the tenant setting TenantPolicyReport.ResourceGroup.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account for the export. Taken from the tenant setting TenantPolicyReport.StorageAccount.Name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountLocation

Azure region used when the storage account has to be created. Taken from the tenant setting TenantPolicyReport.StorageAccount.Location.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountSku

Performance tier used when the storage account has to be created. Taken from the tenant setting TenantPolicyReport.StorageAccount.Sku.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

