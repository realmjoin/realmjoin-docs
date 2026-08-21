---
title: Office365 License Report
description: Generate an Office 365 licensing report
---

## Description
This runbook creates a licensing report based on Microsoft 365 subscription SKUs and optionally includes Exchange Online related reports.
It can export the results to Azure Storage and generate SAS links for downloads.

## Location
Organization → General → Office365 License Report

**Full Runbook name**

rjgit-org_general_office365-license-report

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.3 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Az.Accounts (>= 5.5.2)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Reports.Read.All
    - *Pulls the Office 365 usage and activity report CSVs from /reports*
  - Directory.Read.All
    - *Reads /subscribedSkus and group license assignments for the SKU overview*
  - User.Read.All
    - *Lists users and reads their license details for the per-user reports*
  - ReportSettings.ReadWrite.All
    - *Temporarily disables concealed report names when includeUserData is enabled, then restores the setting*
  - AuditLog.Read.All *(optional — feature: Sign-in export)*
    - *Reads /auditLogs/signIns for the per-application sign-in export when exportToFile is enabled (default on)*
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp *(optional — feature: Exchange licensing report)*
    - *Runs Get-EXOMailbox for the shared mailbox licensing report when includeExchange is enabled*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session when includeExchange is enabled*


## Parameters
### printOverview

If set to true, prints a short license usage overview.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### includeExchange

If set to true, includes Exchange Online related reports (Shared Mailbox licensing).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### includeUserData

If set to true, the Microsoft 365 report privacy setting is temporarily disabled (if currently active) to include real user data such as UPNs in Graph activity reports. The setting is always restored to its original state after the run. Note: Enabling this option will expose personally identifiable information (UPNs) in the exported reports - ensure compliance with your organization's data protection policies before use.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### exportToFile

If set to true, exports reports to Azure Storage when configured.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### exportAsZip

If set to true, exports reports as a single ZIP file.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### produceLinks

If set to true, creates SAS tokens/links for exported artifacts.

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

Storage account name used for uploads. The account must exist before running this report.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SubscriptionId

Azure subscription ID used for storage operations.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

