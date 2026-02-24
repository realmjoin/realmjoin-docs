---
title: Sync Device Serialnumbers To Entraid (Scheduled)
description: Sync Intune serial numbers to Entra ID extension attributes
---

## Description
This runbook retrieves Intune managed devices and syncs their serial numbers into an Entra ID device extension attribute.
It can process all devices or only devices with missing or mismatched values and can optionally send an email report.

## Location
Organization → Devices → Sync Device Serialnumbers To Entraid_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All
  - Device.ReadWrite.All
  - DeviceManagementManagedDevices.Read.All
  - Mail.Send


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

