# Sync Device Serialnumbers To Entraid_Scheduled

Syncs serial numbers from Intune devices to Azure AD device extension attributes.

## Description

This runbook retrieves all managed devices from Intune, extracts their serial numbers,
and updates the corresponding Azure AD device objects' extension attributes.
This helps maintain consistency between Intune and Azure AD device records.

## Location

Org &rarr; Devices &rarr; Sync Device Serialnumbers To Entraid_Scheduled

## Notes

Permissions (Graph):
- DeviceManagementManagedDevices.Read.All
- Directory.ReadWrite.All
- Device.ReadWrite.All

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementManagedDevices.Read.All
- Directory.ReadWrite.All
- Device.ReadWrite.All

## Parameters

### -ExtensionAttributeNumber

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _1_ |
| Required | _false_ |
| Position | _1_ |

### -ProcessAllDevices

**Description:** If true, processes all devices. If false, only processes devices with missing or mismatched serial numbers in AAD. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _2_ |

### -MaxDevicesToProcess

**Description:** Maximum number of devices to process in a single run. Use 0 for unlimited. 

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _0_ |
| Required | _false_ |
| Position | _3_ |

### -sendReportTo

**Description:** Email address to send the report to. If empty, no email will be sent. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _4_ |

### -sendReportFrom

**Description:** Email address to send the report from. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _runbook@glueckkanja.com_ |
| Required | _false_ |
| Position | _5_ |

### -CallerName

**Description:** Caller name for auditing purposes. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _6_ |


