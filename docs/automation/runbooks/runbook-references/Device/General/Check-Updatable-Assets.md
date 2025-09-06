# Check Updatable Assets

Check if a device is onboarded to Windows Update for Business.

## Description

This script checks if single device is onboarded to Windows Update for Business.

## Location

Device &rarr; General &rarr; Check Updatable Assets

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

**Description:** DeviceId of the device to check onboarding status for. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |


