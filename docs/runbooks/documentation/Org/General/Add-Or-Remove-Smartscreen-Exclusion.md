# Add Or Remove Smartscreen Exclusion

Add/Remove a SmartScreen URL Exception/Rule in MS Security Center Indicators

## Description

List/Add/Remove URL indicators entries in MS Security Center.

## Location

Org &rarr; General &rarr; Add Or Remove Smartscreen Exclusion

## Permissions

### API Permissions

**WindowsDefenderATP**
- Ti.ReadWrite.All

## Parameters

### -action

**Description:** 0 - list, 1 - add, 2 - remove 

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _0_ |
| Required | _false_ |
| Position | _1_ |

### -Url

**Description:** please give just the name of the domain, like "exclusiondemo.com" 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _2_ |

### -mode

**Description:** 0 - allow, 1 - audit, 2 - warn, 3 - block 

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _0_ |
| Required | _false_ |
| Position | _3_ |

### -explanationTitle

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Allow this domain in SmartScreen_ |
| Required | _false_ |
| Position | _4_ |

### -explanationDescription

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Required exclusion. Please provide more details._ |
| Required | _false_ |
| Position | _5_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _6_ |


