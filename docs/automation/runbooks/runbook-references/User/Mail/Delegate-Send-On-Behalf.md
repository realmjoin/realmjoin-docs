# Delegate Send On Behalf

Grant another user sendOnBehalf permissions on this mailbox.

## Description

Grant another user sendOnBehalf permissions on this mailbox.

## Location

User &rarr; Mail &rarr; Delegate Send On Behalf

## Permissions

### API Permissions

**Office 365 Exchange Online API**
- Exchange.ManageAsApp

### Required Roles

- Exchange administrator

## Parameters

### -UserName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -delegateTo

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -Remove

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _3_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _4_ |


