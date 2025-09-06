# Add Device Via Corporate Identifier

Import a device into Intune via corporate identifier.

## Description

Import a device into Intune via corporate identifier.

## Location

Org &rarr; General &rarr; Add Device Via Corporate Identifier

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementServiceConfig.ReadWrite.All

## Parameters

### -CorpIdentifierType

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _serialNumber_ |
| Required | _true_ |
| Position | _1_ |

### -CorpIdentifier

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -DeviceDescripton

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |

### -OverwriteExistingEntry

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _4_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _5_ |


