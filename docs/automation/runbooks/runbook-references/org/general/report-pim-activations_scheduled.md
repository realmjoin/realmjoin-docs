---
title: Report Pim Activations (Scheduled)
description: Scheduled report on PIM activations
---

## Description
This runbook queries Microsoft Entra ID audit logs for recent PIM activations.
It builds an report and sends it via email.

## Location
Organization → General → Report Pim Activations_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - AuditLog.Read.All
  - Mail.Send


## Parameters
### sendAlertTo

Recipient email address for the report.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja.com |
| Type | String |

### sendAlertFrom

Sender mailbox UPN used to send the report email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbook@glueckkanja.com |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

