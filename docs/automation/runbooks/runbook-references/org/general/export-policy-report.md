---
title: Export Policy Report
description: Create a report of tenant policies from Intune and Entra ID.
---

## Description
This runbook exports configuration policies from Intune and Entra ID and writes the results to a Markdown report.
It can optionally export raw JSON and create downloadable links for exported artifacts.

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

If set to true, creates links for exported artifacts based on settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### exportJson

If set to true, also exports raw JSON policy payloads.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### renderLatexPagebreaks

If set to true, adds LaTeX page breaks to the generated Markdown.

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



[Back to Runbook Reference overview](../../README.md)

