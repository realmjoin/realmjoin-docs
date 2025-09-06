# Add Devices Of Users To Group_Scheduled

Sync devices of users in a specific group to another device group.

## Description

This runbook reads accounts from a specified Users group and adds their devices to a specified Devices group. It ensures new devices are also added.

## Location

Org &rarr; General &rarr; Add Devices Of Users To Group_Scheduled

## Permissions

No specific permissions documented.

## Parameters

### -UserGroup

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -DeviceGroup

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -CallerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _3_ |

### -IncludeWindowsDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _4_ |

### -IncludeMacOSDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _5_ |

### -IncludeLinuxDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _6_ |

### -IncludeAndroidDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _7_ |

### -IncludeIOSDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _8_ |

### -IncludeIPadOSDevice

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _9_ |


