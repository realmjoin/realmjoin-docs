# Outphase Devices

Remove/Outphase multiple devices

## Description

Remove/Outphase multiple devices. You can choose if you want to wipe the device and/or delete it from Intune an AutoPilot.

## Location

Org &rarr; Devices &rarr; Outphase Devices

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

### -DeviceListChoice

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _0_ |
| Required | _true_ |
| Position | _1_ |

### -DeviceList

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -intuneAction

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _2_ |
| Required | _false_ |
| Position | _3_ |

### -aadAction

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _2_ |
| Required | _false_ |
| Position | _4_ |

### -wipeDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _5_ |

### -removeIntuneDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _6_ |

### -removeAutopilotDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _7_ |

### -removeAADDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _8_ |

### -disableAADDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _9_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _10_ |


