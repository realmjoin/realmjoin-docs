# Check Assignments Of Groups

Check Intune assignments for a given (or multiple) Group Names.

## Description

This script checks the Intune assignments for a single or multiple specified Group Names.

## Location

Org &rarr; General &rarr; Check Assignments Of Groups

## Notes

Permissions (Graph):
- User.Read.All
- Group.Read.All
- DeviceManagementConfiguration.Read.All
- DeviceManagementManagedDevices.Read.All
- Device.Read.All

## Permissions

No specific permissions documented.

## Parameters

### -CallerName

**Description:** Caller name for auditing purposes. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -GroupNames

**Description:** Group Names of the groups to check assignments for, separated by commas. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -IncludeApps

**Description:** Boolean to specify whether to include application assignments in the search. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _3_ |


