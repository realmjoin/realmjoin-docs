# Add Autopilot Device

Import a windows device into Windows Autopilot.

## Description

Import a windows device into Windows Autopilot.

## Location

Org &rarr; General &rarr; Add Autopilot Device

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementServiceConfig.ReadWrite.All

## Parameters

### -SerialNumber

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -HardwareIdentifier

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -AssignedUser

**Description:** MS removed the ability to assign users directly via Autopilot 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |

### -Wait

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _4_ |

### -GroupTag

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _5_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _6_ |


