# Delete Stale Devices_Scheduled

Scheduled deletion of stale devices based on last activity date and platform.

## Description

Identifies, lists, and deletes devices that haven't been active for a specified number of days.
Can be scheduled to run automatically and send a report via email.

## Location

Org &rarr; Devices &rarr; Delete Stale Devices_Scheduled

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementManagedDevices.Read.All
- DeviceManagementManagedDevices.DeleteAll
- Directory.Read.All
- Device.Read.All
- Mail.Send

## Parameters

### -Days

**Description:** Number of days without activity to be considered stale. 

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _30_ |
| Required | _false_ |
| Position | _1_ |

### -Windows

**Description:** Include Windows devices in the results. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _2_ |

### -MacOS

**Description:** Include macOS devices in the results. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _3_ |

### -iOS

**Description:** Include iOS devices in the results. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _4_ |

### -Android

**Description:** Include Android devices in the results. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _5_ |

### -DeleteDevices

**Description:** If set to true, the script will delete the stale devices. If false, it will only report them. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _6_ |

### -ConfirmDeletion

**Description:** If set to true, the script will prompt for confirmation before deleting devices.
Should be set to false for scheduled runs. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _7_ |

### -sendAlertTo

**Description:** Email address to send the report to. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _support@glueckkanja.com_ |
| Required | _false_ |
| Position | _8_ |

### -sendAlertFrom

**Description:** Email address to send the report from. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _runbook@glueckkanja.com_ |
| Required | _false_ |
| Position | _9_ |

### -CallerName

**Description:** Caller name for auditing purposes. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _10_ |


