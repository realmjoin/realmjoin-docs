---
title: Office365 License Report
description: Report Microsoft 365 license usage and availability
---

## Description
Creates a report of the Microsoft 365 licenses in the tenant, how many are in use and how many are free. Exchange Online details such as shared mailbox licensing can be added. The report files can be uploaded to an Azure Storage account, as single files or as one ZIP, with download links. Nothing is changed unless real user data is requested, which briefly switches off the report privacy setting and restores it afterwards.

## Configure the storage account for the export

The report files are uploaded to an Azure Storage account. Its subscription, resource group and name come from the tenant settings below; the container name is taken from `OfficeLicensingReport.Container`. The switches of this runbook are backed by `OfficeLicensingReport.*` settings as well, so their defaults can be fixed per tenant.

```json
{
	"Settings": {
		"OfficeLicensingReport": {
			"ResourceGroup": "rj-test-runbooks-01",
			"SubscriptionId": "00000000-0000-0000-0000-000000000000",
			"StorageAccount": {
				"Name": "rbexports01"
			}
		}
	}
}
```

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).


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

Prints a table per license SKU with total, used, available and suspended counts in the run output.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### includeExchange

Adds Exchange Online reports such as shared mailbox licensing.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### includeUserData

Shows real user names in the activity reports by switching off the report privacy setting for the run; it is restored afterwards. The reports then contain personal data, so check your data protection rules first.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### exportToFile

Uploads the report files to the Azure Storage account configured in the tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### exportAsZip

Uploads one ZIP file instead of the single report files.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### produceLinks

Returns time-limited download links for the uploaded files.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ContainerName

Storage container the report files are uploaded to. Taken from the tenant setting OfficeLicensingReport.Container.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjrb-licensing-report-v2 |
| Type | String |

### ResourceGroupName

Resource group of the storage account. Taken from the tenant setting OfficeLicensingReport.ResourceGroup.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountName

Storage account for the export. Taken from the tenant setting OfficeLicensingReport.StorageAccount.Name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SubscriptionId

Azure subscription that holds the storage account. Taken from the tenant setting OfficeLicensingReport.SubscriptionId.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

