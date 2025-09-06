# Notify Changed CA Policies

Exports the current set of Conditional Access policies to an Azure storage account.

## Description

Exports the current set of Conditional Access policies to an Azure storage account.

## Location

Org &rarr; Security &rarr; Notify Changed CA Policies

## Permissions

### API Permissions

**Microsoft Graph**
- Policy.Read.All
- Mail.Send

## Parameters

### -From

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -To

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _3_ |


