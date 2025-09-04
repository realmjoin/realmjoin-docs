# Restrict Or Release Code Execution

Restrict code execution.

## Description

Only allow Microsoft signed code to be executed.

## Location

Device &rarr; Security &rarr; Restrict Or Release Code Execution

## Notes

Permissions (WindowsDefenderATP, Application):
- Machine.Read.All
- Machine.RestrictExecution

## Permissions

### API Permissions

**WindowsDefenderATP**
- Machine.Read.All
- Machine.RestrictExecution

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

### -Comment

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Possible security risk._ |
| Required | _true_ |
| Position | _3_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _4_ |


