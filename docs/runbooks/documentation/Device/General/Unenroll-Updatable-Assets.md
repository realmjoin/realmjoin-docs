# Unenroll Updatable Assets

Unenroll device from Windows Update for Business.

## Description

This script unenrolls devices from Windows Update for Business.

## Location

Device &rarr; General &rarr; Unenroll Updatable Assets

## Permissions

### API Permissions

**Microsoft Graph**
- WindowsUpdates.ReadWrite.All

## Parameters

### -CallerName

**Description:** Caller name for auditing purposes. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -DeviceId

**Description:** DeviceId of the device to unenroll. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -UpdateCategory

**Description:** Category of updates to unenroll from. Possible values are: driver, feature, quality or all (delete). 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _all_ |
| Required | _true_ |
| Position | _3_ |


