---
title: Enrolled Devices Report (Scheduled)
description: Report first-time device enrollments of the last weeks
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Lists devices that enrolled for the first time within the chosen number of weeks. They are grouped by an attribute of your choice, such as country or department, so you can see where new devices show up. The report can be exported as CSV to an Azure Storage account and downloaded from there.

## Configure the storage account for the CSV export

The CSV export uploads the report to an Azure Storage account. Its resource group, name, region and performance tier come from the tenant settings below; the container name is taken from `EnrolledDevicesReport.Container`.

```json
{
  "Settings": {
    "EnrolledDevicesReport": {
      "ResourceGroup": "rj-test-runbooks-01",
      "StorageAccount": {
        "Name": "rjrbexports01",
        "Location": "West Europe",
        "Sku": "Standard_LRS"
      }
    }
  }
}
```

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).


## Location
Organization → General → Enrolled Devices Report (Scheduled)

**Full Runbook name**

rjgit-org_general_enrolled-devices-report_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.Read.All
    - *Lists all Autopilot devices as the report's base data set*
  - DeviceManagementManagedDevices.Read.All
    - *Reads each Intune device for enrollment date and user info*
  - User.Read.All
    - *Reads the grouping attribute from each device's user when grouping by user properties*
  - Device.ReadWrite.All
    - *Reads Entra device objects for device-property grouping*

### Permission notes
Azure: Contributor on Storage Account


## Parameters
### Weeks

How many weeks back to look for first enrollments.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 4 |
| Type | Int32 |

### dataSource

Date of Autopilot profile assignment counts a device from the day its Autopilot profile was assigned, Date of Intune enrollment from the day it enrolled in Intune.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

### groupingSource

Where the grouping attribute comes from: no grouping, Entra ID user or device properties, Intune device properties, or Autopilot device properties.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |

### groupingAttribute

Name of the attribute the devices are grouped by, for example country or department.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | country |
| Type | String |

### exportCsv

Uploads the report as CSV to the storage account and returns a download link. Needs a configured storage account.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ContainerName

Storage container the report is uploaded to. Taken from the tenant setting EnrolledDevicesReport.Container.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ResourceGroupName

Resource group of the storage account. Taken from the tenant setting EnrolledDevicesReport.ResourceGroup.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountName

Storage account for the export. Taken from the tenant setting EnrolledDevicesReport.StorageAccount.Name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountLocation

Azure region used when the storage account has to be created. Taken from the tenant setting EnrolledDevicesReport.StorageAccount.Location.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountSku

Performance tier used when the storage account has to be created. Taken from the tenant setting EnrolledDevicesReport.StorageAccount.Sku.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

