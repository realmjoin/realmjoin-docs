# Show Or Hide In Address Book

(Un)hide an O365- or static Distribution-group in Address Book.

## Description

(Un)hide an O365- or static Distribution-group in Address Book. Can also show the current state.

## Location

Group &rarr; Mail &rarr; Show Or Hide In Address Book

## Notes

Note, as of 2021-06-28 MS Graph does not support updating existing groups - only on initial creation.
 PATCH : https://graph.microsoft.com/v1.0/groups/{id}
 body = { "resourceBehaviorOptions":["HideGroupInOutlook"] }

## Permissions

### API Permissions

**Office 365 Exchange Online**
- Exchange.ManageAsApp

### Required Roles

- Exchange administrator

## Parameters

### -GroupName

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
| Default Value | _1_ |
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


