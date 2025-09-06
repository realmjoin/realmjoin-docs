# Report Users With More Than 5-Devices

Reports users with more than five registered devices in Entra ID.

## Description

This script queries all devices and their registered users, and reports users who have more than five devices registered.
The output includes the users ObjectId, UPN, and the number of devices.

## Location

Org &rarr; Devices &rarr; Report Users With More Than 5-Devices

## Permissions

### API Permissions

**Microsoft Graph**
- Device.Read.All

## Parameters

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |


