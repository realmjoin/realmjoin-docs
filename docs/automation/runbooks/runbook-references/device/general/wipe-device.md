---
title: Wipe Device
description: Wipe a Windows or MacOS device
---

## Description
Wipe a Windows or MacOS device.

## Location
Device → General → Wipe Device

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

### wipeDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### useProtectedWipe



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
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
| Default Value | False |
| Type | Boolean |

### removeAADDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### disableAADDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### macOsRecevoryCode

Only for old MacOS devices. Newer devices can be wiped without a recovery code.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 123456 |
| Type | String |

### macOsObliterationBehavior

"default": Use EACS to wipe user data, reatining the OS. Will wipe the OS, if EACS fails.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | default |
| Type | String |


[Back to Table of Content](../../README.md)

