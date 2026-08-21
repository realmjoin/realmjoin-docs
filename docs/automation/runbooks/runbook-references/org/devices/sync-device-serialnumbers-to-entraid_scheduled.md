---
title: Sync Device Serialnumbers To Entraid (Scheduled)
description: Sync Intune serial numbers to Entra ID extension attributes
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
This runbook retrieves Intune managed devices and syncs their serial numbers into an Entra ID device extension attribute.
It can process all devices or only devices with missing or mismatched values and can optionally send an email report.

## Location
Organization → Devices → Sync Device Serialnumbers To Entraid (Scheduled)

**Full Runbook name**

rjgit-org_devices_sync-device-serialnumbers-to-entraid_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All
    - *Reads /organization for the tenant display name in the email report*
  - Device.ReadWrite.All
    - *Lists Entra devices and patches their extensionAttributes with the Intune serial number*
  - DeviceManagementManagedDevices.Read.All
    - *Reads Intune managed devices to obtain serialNumber and azureADDeviceId*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the HTML sync report via /users/{sendReportFrom}/sendMail when sendReportTo is configured*


## Parameters
### ExtensionAttributeNumber

Extension attribute number to update

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |

### ProcessAllDevices

If set to true, processes all devices; otherwise only devices with missing or mismatched values are processed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### MaxDevicesToProcess

Maximum number of devices to process in a single run. Use 0 for unlimited.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

### sendReportTo

Email address to send the report to. If empty, no email will be sent.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### sendReportFrom

Email address to send the report from.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbook@glueckkanja.com |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

