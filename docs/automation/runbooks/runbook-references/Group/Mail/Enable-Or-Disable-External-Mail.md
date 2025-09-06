# Enable Or Disable External Mail

Enable/disable external parties to send eMails to O365 groups.

## Description

Enable/disable external parties to send eMails to O365 groups.

## Location

Group &rarr; Mail &rarr; Enable Or Disable External Mail

## Notes

Notes: Setting this via graph is currently broken as of 2021-06-28:
 attribute: allowExternalSenders
 https://docs.microsoft.com/en-us/graph/known-issues#setting-the-allowexternalsenders-property

## Permissions

### API Permissions

**Office 365 Exchange Online**
- Exchange.ManageAsApp

### Required Roles

- Exchange administrator

## Parameters

### -GroupId

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -Action

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _0_ |
| Required | _false_ |
| Position | _2_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _3_ |


