---
title: List Vulnerable App Regs
description: List app registrations possibly affected by CVE-2021-42306
---

## Description
Checks the key credentials of every app registration in Entra ID for signs of CVE-2021-42306, where private key material was stored in the credential by mistake. App registrations that may be affected are listed. The result can be shown in the run output or exported as a CSV file to an Azure Storage account. Nothing is changed.

## Location
Organization → Security → List Vulnerable App Regs

**Full Runbook name**

rjgit-org_security_list-vulnerable-app-regs

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Az.Storage (>= 9.7.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Application.Read.All
    - *Enumerates app registrations and their key credentials via /applications*


## Parameters
### ExportToFile

List in the run output, or export to a CSV file in the storage account configured in the tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

**Portal options**

| Portal option | Value |
| --- | --- |
| Export to a CSV file | true |
| List in the run output | false |

### ContainerName

Storage container the report files are uploaded to. Taken from the tenant setting VulnAppRegExport.Container.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group of the storage account. Taken from the tenant setting VulnAppRegExport.ResourceGroup.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account for the export. Taken from the tenant setting VulnAppRegExport.StorageAccount.Name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountLocation

Azure region used when the storage account has to be created. Taken from the tenant setting VulnAppRegExport.StorageAccount.Location.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountSku

Performance tier used when the storage account has to be created. Taken from the tenant setting VulnAppRegExport.StorageAccount.Sku.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

