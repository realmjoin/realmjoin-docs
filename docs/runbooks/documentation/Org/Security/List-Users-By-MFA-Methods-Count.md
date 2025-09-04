# List Users By MFA Methods Count

Reports users by the count of their registered MFA methods.

## Description

This Runbook retrieves a list of users from Azure AD and counts their registered MFA authentication methods.
As a dropdown for the MFA methods count range, you can select from "0 methods (no MFA)", "1-3 methods", "4-5 methods", or "6+ methods".
The output includes the user display name, user principal name, and the count of registered MFA methods.

## Location

Org &rarr; Security &rarr; List Users By MFA Methods Count

## Permissions

### API Permissions

**Microsoft Graph**
- User.Read.All
- UserAuthenticationMethod.Read.All

## Parameters

### -mfaMethodsRange

**Description:** Range for filtering users based on the count of their registered MFA methods. 

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


