# Outphase Device

Remove/Outphase a windows device

## Description

Remove/Outphase a windows device. You can choose if you want to wipe the device and/or delete it from Intune an AutoPilot.

## Location

Device &rarr; General &rarr; Outphase Device

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementManagedDevices.PrivilegedOperations.All
- DeviceManagementManagedDevices.ReadWrite.All
- DeviceManagementServiceConfig.ReadWrite.All
- Device.Read.All

### Required Roles

- Cloud device administrator

## Parameters

### -DeviceId

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -intuneAction

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _2_ |
| Required | _false_ |
| Position | _2_ |

### -aadAction

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _2_ |
| Required | _false_ |
| Position | _3_ |

### -wipeDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _4_ |

### -removeIntuneDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _5_ |

### -removeAutopilotDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _6_ |

### -removeAADDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _7_ |

### -disableAADDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _8_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _9_ |


