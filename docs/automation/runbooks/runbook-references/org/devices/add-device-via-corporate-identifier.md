---
title: Add Device Via Corporate Identifier
description: Import a device into Intune via corporate identifier
---

## Description
This runbook imports a device into Intune using a corporate identifier such as serial number or IMEI.
It can overwrite existing entries and optionally stores a description for the imported identity.

## Location
Organization → Devices → Add Device Via Corporate Identifier

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.ReadWrite.All


## Parameters
### CorpIdentifierType

Identifier type to use for import.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | serialNumber |
| Type | String |

### CorpIdentifier

Identifier value to import.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DeviceDescripton

Optional description stored for the imported identity.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### OverwriteExistingEntry

If set to true, an existing entry for the same identifier will be overwritten.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

