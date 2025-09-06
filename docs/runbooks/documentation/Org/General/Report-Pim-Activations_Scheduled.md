# Report Pim Activations_Scheduled

Scheduled Report on PIM Activations.

## Description

This runbook collects and reports PIM activation details, including date, requestor, UPN, role, primary target, PIM group, reason, and status, and sends it via email.

## Location

Org &rarr; General &rarr; Report Pim Activations_Scheduled

## Permissions

### API Permissions

**Microsoft Graph**
- AuditLog.Read.All
- Mail.Send

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
| Default Value | _runbook@glueckkanja.com_ |
| Required | _false_ |
| Position | _3_ |


