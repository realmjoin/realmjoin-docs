# Check Aad Sync Status_Scheduled

Check for last Azure AD Connect Sync Cycle.

## Description

This runbook checks the Azure AD Connect sync status and the last sync date and time.

## Location

Org &rarr; General &rarr; Check Aad Sync Status_Scheduled

## Permissions

### API Permissions

**Microsoft Graph**
- Directory.Read.All

## Parameters

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -sendAlertTo

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _support@glueckkanja.com_ |
| Required | _false_ |
| Position | _2_ |

### -sendAlertFrom

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _runbooks@glueckkanja.com_ |
| Required | _false_ |
| Position | _3_ |


