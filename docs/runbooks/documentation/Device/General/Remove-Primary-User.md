# Remove Primary User

Removes the primary user from a device.

## Description

This script removes the assigned primary user from a specified Azure AD device.
It requires the DeviceId of the target device and the name of the caller for auditing purposes.

## Location

Device &rarr; General &rarr; Remove Primary User

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementManagedDevices.ReadWrite.All

## Parameters

### -DeviceId

**Description:** The unique identifier of the device from which the primary user will be removed.
It will be prefilled from the RealmJoin Portal and is hidden in the UI. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |


