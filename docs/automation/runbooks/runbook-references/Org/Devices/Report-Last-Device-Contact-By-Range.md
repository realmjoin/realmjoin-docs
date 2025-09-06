# Report Last Device Contact By Range

Reports Windows devices with last device contact within a specified date range.

## Description

This Runbook retrieves a list of Windows devices from Azure AD / Intune, filtered by their
last device contact time (lastSyncDateTime). As a dropdown for the date range, you can select from 0-30 days, 30-90 days, 90-180 days, 180-365 days, or 365+ days.
The output includes the device name, last sync date, user ID, user display name, and user principal name.

## Location

Org &rarr; Devices &rarr; Report Last Device Contact By Range

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementManagedDevices.Read.All

## Parameters

### -dateRange

**Description:** Date range for filtering devices based on their last contact time. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -systemType

**Description:** The operating system type of the devices to filter. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Windows_ |
| Required | _true_ |
| Position | _2_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _3_ |


