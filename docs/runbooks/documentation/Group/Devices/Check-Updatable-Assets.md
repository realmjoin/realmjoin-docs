# Check Updatable Assets

Check if devices in a group are onboarded to Windows Update for Business.

## Description

This script checks if single or multiple devices (by Group Object ID) are onboarded to Windows Update for Business.

## Location

Group &rarr; Devices &rarr; Check Updatable Assets

## Permissions

### API Permissions

**Microsoft Graph**
- Device.Read.All
- Group.Read.All
- WindowsUpdates.ReadWrite.All

### Manual Permissions

- Azure: Contributor on Storage Account

## Parameters

### -CallerName

**Description:** Caller name for auditing purposes. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -GroupId

**Description:** Object ID of the group to check onboarding status for its members. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |


