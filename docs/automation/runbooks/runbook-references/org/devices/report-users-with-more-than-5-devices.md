---
title: Report Users With More Than 5-Devices
description: Reports users with more than five registered devices in Entra ID.
---

## Description
This script queries all devices and their registered users, and reports users who have more than five devices registered.
The output includes the user's Object ID, UPN, display name, and the number of devices.

Optionally, the report can be sent via email with a CSV attachment containing detailed device information for each user.

## Setup regarding email sending

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

This process is described in detail in the [Setup Email Reporting](https://github.com/realmjoin/realmjoin-runbooks/tree/master/docs/general/setup-email-reporting.md) documentation.


## Location
Organization → Devices → Report Users With More Than 5-Devices

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Device.Read.All
  - Mail.Send


## Parameters
### EmailFrom

The sender email address. This needs to be configured in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### EmailTo

If specified, an email with the report will be sent to the provided address(es).
Can be a single address or multiple comma-separated addresses (string).
The function sends individual emails to each recipient for privacy reasons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

