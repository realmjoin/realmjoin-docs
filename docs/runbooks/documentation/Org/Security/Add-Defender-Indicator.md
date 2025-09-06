# Add Defender Indicator

Create new Indicator in Defender for Endpoint.

## Description

Create a new Indicator in Defender for Endpoint e.g. to allow a specific file using it's hash value or allow a specific url that by default is blocked by Defender for Endpoint

## Location

Org &rarr; Security &rarr; Add Defender Indicator

## Permissions

### API Permissions

**WindowsDefenderATP**
- Ti.ReadWrite.All

## Parameters

### -IndicatorValue

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -IndicatorType

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _FileSha256_ |
| Required | _true_ |
| Position | _2_ |

### -Title

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _3_ |

### -Description

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _4_ |

### -Action

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Allowed_ |
| Required | _true_ |
| Position | _5_ |

### -Severity

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Informational_ |
| Required | _true_ |
| Position | _6_ |

### -GenerateAlert

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _False_ |
| Required | _true_ |
| Position | _7_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _8_ |


