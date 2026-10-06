---
title: Get Teams Phone Number Assignment
description: Check whether a phone number is assigned in Microsoft Teams
---

## Description
Looks up whether a phone number is assigned to a user in Microsoft Teams. If it is, the user and their voice policies are shown in the Output Data tab. Nothing is changed.

## Additional documentation
If a Teams user is found for the phone number, the following details are shown in the Output Data tab, table "Phone number assignment":
- Phone number
- Display name
- User principal name
- Account type
- Phone number type
- Online voice routing policy
- Calling policy
- Dial plan
- Tenant dial plan

## Location
Organization → Phone → Get Teams Phone Number Assignment

**Full Runbook name**

rjgit-org_phone_get-teams-phone-number-assignment

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>MicrosoftTeams (>= 7.9.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All
    - *Required by the app-based Teams PowerShell sign-in (Connect-MicrosoftTeams -Identity) to read tenant info*

### RBAC roles
- Teams Administrator
  - *Required to run Get-CsPhoneNumberAssignment and Get-CsOnlineUser via app-based Teams PowerShell*


## Parameters
### PhoneNumber

Number in international format without spaces, for example +49321987654, optionally with an extension as +49321987654;ext=123.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Phone number |



[Back to Runbook Reference overview](../../README.md)

