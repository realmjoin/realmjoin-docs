---
title: Show Filevault Recovery Key
description: Display macOS FileVault recovery key
---

## Description
Retrieves and displays the FileVault recovery key for a macOS device enrolled in Intune. This key is used to unlock the device if the user forgets their password or the device becomes locked.

## Location
Device → Security → Show Filevault Recovery Key

**Full Runbook name**

rjgit-device_security_show-filevault-recovery-key

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.PrivilegedOperations.All
  - DeviceManagementManagedDevices.Read.All


## Parameters
### DeviceId

The Azure AD Device ID of the macOS device

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

