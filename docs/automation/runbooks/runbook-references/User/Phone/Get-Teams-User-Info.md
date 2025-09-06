# Get Teams User Info

Get the status quo of a Microsoft Teams user in terms of phone number, if any, and certain Microsoft Teams policies.

## Description

Get the status quo of a Microsoft Teams user in terms of phone number, if any, and certain Microsoft Teams policies.

## Location

User &rarr; Phone &rarr; Get Teams User Info

## Permissions

### API Permissions

**Microsoft Graph**
- Organization.Read.All

### Required Roles

- Teams Administrator

## Parameters

### -UserName

**Description:** The user for whom the status quo should be retrieved. This can be filled in with the user picker in the UI. 

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
| Required | _false_ |
| Position | _2_ |


