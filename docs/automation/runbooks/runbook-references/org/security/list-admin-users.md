---
title: List Admin Users
description: List all Entra ID admins and check their MFA methods
---

## Description
Lists every user and service principal that holds a built-in Entra ID role, including PIM eligible assignments, as an admin-to-role report. Optionally the registered authentication methods of each admin are checked to show who is protected by MFA, with a choice of which methods count. The report can be uploaded as CSV to an Azure Storage account. Nothing is changed.

## Location
Organization → Security → List Admin Users

**Full Runbook name**

rjgit-org_security_list-admin-users

## Details

| Property | Value |
| --- | --- |
| Version | 1.2.4 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
    - *Reads role holders' user details when resolving principals*
  - Directory.Read.All
    - *Resolves role-holder principal ids to users, groups or service principals via /directoryObjects*
  - RoleManagement.Read.All
    - *Lists role definitions, role assignments and PIM eligibility schedules*
  - RoleAssignmentSchedule.Read.Directory
    - *Reads roleAssignmentScheduleInstances to report PIM assignment end dates*
  - UserAuthenticationMethod.Read.All *(optional — feature: MFA state)*
    - *Reads each admin's authentication methods when QueryMfaState is enabled (default on)*


## Parameters
### ExportToFile

Uploads the report as CSV to the storage account configured in the tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### PimEligibleUntilInCSV

Adds the end dates of PIM eligible and active assignments to the CSV report.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ContainerName

Storage container the report files are uploaded to. Taken from the tenant setting ListAdminsReport.Container.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group of the storage account. Taken from the tenant setting ListAdminsReport.ResourceGroup.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account for the export. Taken from the tenant setting ListAdminsReport.StorageAccount.Name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountLocation

Azure region used when the storage account has to be created. Taken from the tenant setting ListAdminsReport.StorageAccount.Location.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountSku

Performance tier used when the storage account has to be created. Taken from the tenant setting ListAdminsReport.StorageAccount.Sku.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### QueryMfaState

With the check, each admin gets a column showing whether a method that counts as MFA is registered; without it, the report lists only the role assignments.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

**Portal options**

| Portal option | Value |
| --- | --- |
| Check and report the MFA state of every admin | true |
| Do not check MFA states | false |

### TrustEmailMfa

Counts email as a valid MFA method.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### TrustPhoneMfa

Counts phone calls and SMS as a valid MFA method.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### TrustSoftwareOathMfa

Counts software OATH tokens as a valid MFA method.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### TrustWinHelloMFA

Counts Windows Hello for Business as a valid MFA method.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

