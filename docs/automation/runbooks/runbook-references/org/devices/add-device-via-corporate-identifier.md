---
title: Add Device Via Corporate Identifier
description: Import a device into Intune via corporate identifier.
---

## Description
This runbook imports a device into Intune via corporate identifier (serial number or IMEI). It supports overwriting existing entries and adding a description to the device.

## Location
Organization → Devices → Add Device Via Corporate Identifier

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.ReadWrite.All


## Parameters
### CorpIdentifierType



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | serialNumber |
| Type | String |

### CorpIdentifier



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DeviceDescripton



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### OverwriteExistingEntry



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |


[Back to Table of Content](../../README.md)

