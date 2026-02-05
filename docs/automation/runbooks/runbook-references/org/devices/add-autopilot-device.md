---
title: Add Autopilot Device
description: Import a windows device into Windows Autopilot.
---

## Description
This runbook imports a windows device into Windows Autopilot using the device's serial number and hardware hash.

## Location
Organization → Devices → Add Autopilot Device

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.ReadWrite.All


## Parameters
### SerialNumber



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### HardwareIdentifier



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### AssignedUser

MS removed the ability to assign users directly via Autopilot

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Wait



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### GroupTag



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

