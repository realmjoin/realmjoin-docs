---
title: Add Device Via Corporate Identifier
description: Register a device in Intune by its corporate identifier
---

## Description
Adds a device to Intune's list of corporate identifiers, such as a serial number or IMEI, so it counts as corporate-owned when it enrolls. An existing entry for the same identifier can be overwritten, and a description can be stored with it.

## Location
Organization → Devices → Add Device Via Corporate Identifier

**Full Runbook name**

rjgit-org_devices_add-device-via-corporate-identifier

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.ReadWrite.All
    - *Imports the serial or IMEI as Intune corporate identifier via importDeviceIdentityList*


## Parameters
### CorpIdentifierType

Serial number for most devices, IMEI for cellular devices.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | serialNumber |
| Type | String |
| Portal display name | Identifier type |

**Portal options**

| Portal option | Value |
| --- | --- |
| Serial Number | serialNumber |
| IMEI | imei |

### CorpIdentifier

Value of the chosen identifier, exactly as printed on or reported by the device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Identifier |

### DeviceDescripton

Free text stored with the identifier, for example the device model or its owner.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Description |

### OverwriteExistingEntry

Replaces an entry that already exists for the same identifier.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Overwrite an existing entry? |



[Back to Runbook Reference overview](../../README.md)

