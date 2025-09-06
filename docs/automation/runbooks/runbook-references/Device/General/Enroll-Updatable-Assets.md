# Enroll Updatable Assets

Enroll device into Windows Update for Business.

## Description

This script enrolls devices into Windows Update for Business.

## Location

Device &rarr; General &rarr; Enroll Updatable Assets

## Permissions

### API Permissions

**Microsoft Graph**
- WindowsUpdates.ReadWrite.All

## Parameters

### -CallerName

**Description:** Caller name for auditing purposes. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -DeviceId

**Description:** DeviceId of the device to unenroll. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -UpdateCategory

**Description:** Category of updates to enroll into. Possible values are: driver, feature or quality. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _feature_ |
| Required | _true_ |
| Position | _3_ |


