# Report Devices Without Primary User

Reports all managed devices in Intune that do not have a primary user assigned.

## Description

This script retrieves all managed devices from Intune, and filters out those without a primary user (userId).
The output is a formatted table showing Object ID, Device ID, Display Name, and Last Sync Date/Time for each device without a primary user.

## Location

Org &rarr; Devices &rarr; Report Devices Without Primary User

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementManagedDevices.Read.All

## Parameters

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |


