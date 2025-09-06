# Wipe Device

Wipe a Windows or MacOS device

## Description

Wipe a Windows or MacOS device.

## Location

Device &rarr; General &rarr; Wipe Device

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

### -wipeDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _2_ |

### -useProtectedWipe

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _3_ |

### -removeIntuneDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _4_ |

### -removeAutopilotDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _5_ |

### -removeAADDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _6_ |

### -disableAADDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _7_ |

### -macOsRecevoryCode

**Description:** Only for old MacOS devices. Newer devices can be wiped without a recovery code. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _123456_ |
| Required | _false_ |
| Position | _8_ |

### -macOsObliterationBehavior

**Description:** "default": Use EACS to wipe user data, reatining the OS. Will wipe the OS, if EACS fails. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _default_ |
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


