---
title: Sync Device Serialnumbers To Entraid (Scheduled)
description: Copy Intune serial numbers into an Entra ID extension attribute
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Writes the serial number of each Intune managed device into one of the extension attributes of its Entra ID device object. That makes the serial number usable in dynamic groups and filters. By default only devices with a missing or different value are updated. A report can be sent by email.

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

Which of the Entra ID extension attributes (1 to 15) receives the serial number.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |
| Portal display name | Extension attribute number |

### ProcessAllDevices

Writes the attribute on every device, not only where it is missing or differs.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Process all devices? |

### MaxDevicesToProcess

Stops after this many devices; 0 means no limit.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Maximum devices per run |

### sendReportTo

Address the report is sent to. Leave empty to send none.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Report recipient |

### sendReportFrom

Sender address of the report email. Use a mailbox that exists in the tenant.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbook@glueckkanja.com |
| Type | String |
| Portal display name | Report sender |



[Back to Runbook Reference overview](../../README.md)

