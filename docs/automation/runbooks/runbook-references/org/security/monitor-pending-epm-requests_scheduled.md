---
title: Monitor Pending EPM Requests (Scheduled)
description: Monitor and report pending Endpoint Privilege Management (EPM) elevation requests.
---

## Description
Queries Microsoft Intune for pending EPM elevation requests and sends an email report.
Email is only sent when there are pending requests.
Optionally includes detailed information about each request in a table and CSV attachment.

## Setup regarding email sending

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

This process is described in detail in the [Setup Email Reporting](https://github.com/realmjoin/realmjoin-runbooks/tree/master/docs/general/setup-email-reporting.md) documentation.


## Location
Organization → Security → Monitor Pending EPM Requests_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementConfiguration.Read.All
  - Mail.Send


## Parameters
### DetailedReport

When enabled, includes detailed request information in a table and as CSV attachment.
When disabled, only provides a summary count of pending requests.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### EmailTo

Can be a single address or multiple comma-separated addresses (string).
The function sends individual emails to each recipient for privacy reasons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

