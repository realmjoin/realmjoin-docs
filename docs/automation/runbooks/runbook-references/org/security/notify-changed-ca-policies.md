---
title: Notify Changed CA Policies
description: Alert by email about Conditional Access policy changes
---

## Description
Checks which Conditional Access policies were created or changed within the last 24 hours and sends an email with the list attached. Without changes, no email is sent. Nothing is changed in the tenant.

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

User in the tenant the alert is sent as; needs a mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Alert sender |

### To

Gets the email with the list of changed policies.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Alert recipient |



[Back to Runbook Reference overview](../../README.md)

