---
title: Check Aad Sync Status (Scheduled)
description: Check for last Azure AD Connect Sync Cycle.
---

## Description
This runbook checks the Azure AD Connect sync status and the last sync date and time.

## Location
Organization → General → Check Aad Sync Status_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Directory.Read.All


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
| Default Value | runbooks@glueckkanja.com |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

