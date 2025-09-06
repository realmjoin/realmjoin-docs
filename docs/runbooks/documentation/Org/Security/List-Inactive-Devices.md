# List Inactive Devices

List/export inactive evices, which had no recent user logons.

## Description

Collect devices based on the date of last user logon or last Intune sync.

## Location

Org &rarr; Security &rarr; List Inactive Devices

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementManagedDevices.Read.All
- Directory.Read.All
- Device.Read.All

## Parameters

### -Days

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _30_ |
| Required | _false_ |
| Position | _1_ |

### -Sync

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _2_ |

### -ExportToFile

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _3_ |

### -ContainerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _4_ |

### -ResourceGroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _5_ |

### -StorageAccountName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _6_ |

### -StorageAccountLocation

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _7_ |

### -StorageAccountSku

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
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


