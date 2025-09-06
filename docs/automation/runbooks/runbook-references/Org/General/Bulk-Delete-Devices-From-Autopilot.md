# Bulk Delete Devices From Autopilot

Mass-Delete Autopilot objects based on Serial Number.

## Description

This runbook deletes Autopilot objects in bulk based on a list of serial numbers.

## Location

Org &rarr; General &rarr; Bulk Delete Devices From Autopilot

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementServiceConfig.ReadWrite.All

## Parameters

### -SerialNumbers

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |


