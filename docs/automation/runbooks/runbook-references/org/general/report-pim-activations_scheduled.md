---
title: Report Pim Activations (Scheduled)
description: Scheduled Report on PIM Activations.
---

## Description
This runbook collects and reports PIM activation details, including date, requestor, UPN, role, primary target, PIM group, reason, and status, and sends it via email.

## Location
Organization → General → Report Pim Activations_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - AuditLog.Read.All
  - Mail.Send


## Parameters
### sendAlertTo



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja.com |
| Type | String |

### sendAlertFrom



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbook@glueckkanja.com |
| Type | String |


[Back to Table of Content](../../README.md)

