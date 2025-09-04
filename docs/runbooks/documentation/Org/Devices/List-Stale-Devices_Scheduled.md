# List Stale Devices_Scheduled

Scheduled report of stale devices based on last activity date and platform.

## Description

Identifies and lists devices that haven't been active for a specified number of days.
Automatically sends a report via email.

## Location

Org &rarr; Devices &rarr; List Stale Devices_Scheduled

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementManagedDevices.Read.All
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

### -sendAlertTo

**Description:** Email address to send the report to. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _support@glueckkanja.com_ |
| Required | _false_ |
| Position | _6_ |

### -sendAlertFrom

**Description:** Email address to send the report from. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _runbook@glueckkanja.com_ |
| Required | _false_ |
| Position | _7_ |

### -CallerName

**Description:** Caller name for auditing purposes. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _8_ |


