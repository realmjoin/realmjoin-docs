---
title: Show Filevault Recovery Key
description: Show the FileVault recovery key of this Mac
---

## Description
Shows the FileVault recovery key that Intune has stored for this macOS device. Use it to unlock the Mac when the user has forgotten the password or the device is locked. Nothing is changed.

## Location
Device → Security → Show Filevault Recovery Key

**Full Runbook name**

rjgit-device_security_show-filevault-recovery-key

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.PrivilegedOperations.All
    - *Retrieves the escrowed FileVault key via getFileVaultKey, a privileged Intune operation*
  - DeviceManagementManagedDevices.Read.All
    - *Resolves the Intune device by azureADDeviceId and verifies it runs macOS*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

