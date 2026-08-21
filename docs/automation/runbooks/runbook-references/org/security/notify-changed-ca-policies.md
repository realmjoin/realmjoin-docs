---
title: Notify Changed CA Policies
description: Send notification email if Conditional Access policies have been created or modified in the last 24 hours.
---

## Description
Checks Conditional Access policies for changes in the last 24 hours and sends an email with a text attachment listing the changed policies. If no changes are detected, no email is sent.

## Location
Organization → Security → Notify Changed CA Policies

**Full Runbook name**

rjgit-org_security_notify-changed-CA-Policies

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Policy.Read.All
    - *Reads the Conditional Access policies to find changes of the last 24 hours*
  - Mail.Send
    - *Sends the changed-policy alert via /users/{sender}/sendMail when changes are found*
  - User.Read.All
    - *Resolves the sender mailbox via /users/{From} before sending the alert*


## Parameters
### From

Sender email address used to send the notification.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Sender Mail Address |

### To

Recipient email address for the notification.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Recipient Mail Address |



[Back to Runbook Reference overview](../../README.md)

