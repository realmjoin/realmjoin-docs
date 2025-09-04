# Disable Teams Phone

Microsoft Teams telephony offboarding

## Description

Remove the phone number and specific policies from a teams-enabled user.

## Location

User &rarr; Phone &rarr; Disable Teams Phone

## Permissions

### API Permissions

**Microsoft Graph**
- Organization.Read.All

### Required Roles

- Teams Administrator

## Parameters

### -UserName

**Description:** User which should be cleared. Could be filled with the user picker in the UI. 

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
| Required | _true_ |
| Position | _2_ |


