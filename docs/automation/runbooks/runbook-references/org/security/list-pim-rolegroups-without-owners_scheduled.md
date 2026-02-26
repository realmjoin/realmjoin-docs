---
title: List Pim Rolegroups Without Owners (Scheduled)
description: List role-assignable groups with eligible role assignments but without owners
---

## Description
Finds role-assignable groups that have PIM eligible role assignments but no owners assigned. Optionally sends an email alert containing the group names.

## Location
Organization → Security → List Pim Rolegroups Without Owners (Scheduled)

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.Read.All
  - RoleManagement.Read.Directory
  - Mail.Send


## Parameters
### SendEmailIfFound

If set to true, sends an email when matching groups are found.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### From

Sender email address used to send the alert.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | reports@contoso.com |
| Type | String |

### To

Recipient email address for the alert.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja-gab.com |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

