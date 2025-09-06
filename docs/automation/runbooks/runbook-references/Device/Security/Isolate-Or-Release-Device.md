# Isolate Or Release Device

Isolate this device.

## Description

Isolate this device using Defender for Endpoint.

## Location

Device &rarr; Security &rarr; Isolate Or Release Device

## Notes

Permissions (WindowsDefenderATP, Application):
- Machine.Read.All
- Machine.Isolate

## Permissions

### API Permissions

**WindowsDefenderATP**
- Machine.Read.All
- Machine.Isolate

## Parameters

### -DeviceId

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -Release

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _true_ |
| Position | _2_ |

### -IsolationType

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Full_ |
| Required | _false_ |
| Position | _3_ |

### -Comment

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Possible security risk._ |
| Required | _true_ |
| Position | _4_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _5_ |


