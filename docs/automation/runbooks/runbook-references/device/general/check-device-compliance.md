---
title: Check Device Compliance
description: Check the compliance status of a device
---

## Description
This runbook retrieves the compliance status of a managed device from Microsoft Intune.
In simple mode it shows the overall compliance state and lists any non-compliant policies. In detailed mode it additionally shows which specific settings are failing and the reason for each failure.
Optionally, a report with the full compliance details can be sent via email.

## Location
Device → General → Check Device Compliance

**Full Runbook name**

rjgit-device_general_check-device-compliance

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
  - DeviceManagementManagedDevices.Read.All
  - Organization.Read.All


## Parameters
### DeviceId

The Entra ID device ID of the target device. Passed automatically by the RealmJoin platform.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DetailedOutput

Select "Simple" (final value: $false) to show only the overall compliance state and non-compliant policy names.
Select "Detailed" (final value: $true) to additionally show which specific settings are failing and the reason for each failure.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### EmailTo

Optional - if specified, a compliance report will be sent to the provided email address(es).
Can be a single address or multiple comma-separated addresses.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

