---
title: Sync Device Serialnumbers To Entraid (Scheduled)
description: Syncs serial numbers from Intune devices to Azure AD device extension attributes.
---

## Description
This runbook retrieves all managed devices from Intune, extracts their serial numbers,
and updates the corresponding Azure AD device objects' extension attributes.
This helps maintain consistency between Intune and Azure AD device records.

## Location
Organization → Devices → Sync Device Serialnumbers To Entraid_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All
  - DeviceManagementManagedDevices.Read.All
  - Device.ReadWrite.All
  - Mail.Send


## Parameters
### ExtensionAttributeNumber



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1 |
| Type | Int32 |

### ProcessAllDevices

If true, processes all devices. If false, only processes devices with missing or mismatched serial numbers in AAD.

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

