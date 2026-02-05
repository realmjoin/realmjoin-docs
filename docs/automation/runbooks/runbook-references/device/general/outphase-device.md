---
title: Outphase Device
description: Remove/Outphase a windows device
---

## Description
Remove/Outphase a windows device. You can choose if you want to wipe the device and/or delete it from Intune an AutoPilot.

## Location
Device → General → Outphase Device

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.PrivilegedOperations.All
  - DeviceManagementManagedDevices.ReadWrite.All
  - DeviceManagementServiceConfig.ReadWrite.All
  - Device.Read.All

### RBAC roles
- Cloud device administrator


## Parameters
### DeviceId



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### intuneAction



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |

### aadAction



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 2 |
| Type | Int32 |

### wipeDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### removeIntuneDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### removeAutopilotDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### removeAADDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### disableAADDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

