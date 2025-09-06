# Report Apple Mdm Cert Expiry_Scheduled

Monitor/Report expiry of Apple device management certificates.

## Description

Monitor/Report expiry of Apple device management certificates.

## Location

Org &rarr; General &rarr; Report Apple Mdm Cert Expiry_Scheduled

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementManagedDevices.Read.All
- DeviceManagementServiceConfig.Read.All
- DeviceManagementConfiguration.Read.All
- Mail.Send

## Parameters

### -CallerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -Days

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _300_ |
| Required | _false_ |
| Position | _2_ |

### -sendAlertTo

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _support@glueckkanja.com_ |
| Required | _false_ |
| Position | _3_ |

### -sendAlertFrom

**Description:** Please make sure this from-Adress exists in Exchange Online 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _runbook@glueckkanja.com_ |
| Required | _false_ |
| Position | _4_ |


