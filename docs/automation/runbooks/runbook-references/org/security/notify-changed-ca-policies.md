---
title: Notify Changed CA Policies
description: Send notification email if Conditional Access policies have been created or modified in the last 24 hours.
---

## Description
Checks Conditional Access policies for changes in the last 24 hours and sends an email with a text attachment listing the changed policies. If no changes are detected, no email is sent.

## Location
Organization → Security → Notify Changed CA Policies

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Policy.Read.All
  - Mail.Send


## Parameters
### From

Sender email address used to send the notification.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### To

Recipient email address for the notification.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

