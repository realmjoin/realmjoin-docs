# Office365 License Report

Generate an Office 365 licensing report.

## Description

Generate an Office 365 licensing report.

## Location

Org &rarr; General &rarr; Office365 License Report

## Permissions

### API Permissions

**Microsoft Graph**
- Reports.Read.All
- Directory.Read.All
- User.Read.All

## Parameters

### -printOverview

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _1_ |

### -includeExhange

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _2_ |

### -exportToFile

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _3_ |

### -exportAsZip

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _4_ |

### -produceLinks

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _5_ |

### -ContainerName

**Description:** Make a persistent container the default, so you can simply update PowerBI's report from the same source 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _rjrb-licensing-report-v2_ |
| Required | _false_ |
| Position | _6_ |

### -ResourceGroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _7_ |

### -StorageAccountName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _8_ |

### -StorageAccountLocation

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _9_ |

### -StorageAccountSku

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _10_ |

### -SubscriptionId

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _11_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _12_ |


