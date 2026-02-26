---
title: Check Aad Sync Status (Scheduled)
description: Check last Azure AD Connect sync status
---

## Description
This runbook checks whether on-premises directory synchronization is enabled and when the last sync happened.
It can send an email alert if synchronization is not enabled.

## Location
Organization → General → Check Aad Sync Status (Scheduled)

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Directory.Read.All


## Parameters
### sendAlertTo

Email address to send the report to.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja.com |
| Type | String |

### sendAlertFrom

Sender mailbox used for sending the report.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbooks@glueckkanja.com |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

