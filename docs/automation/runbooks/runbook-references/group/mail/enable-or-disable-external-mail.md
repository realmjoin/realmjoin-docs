---
title: Enable Or Disable External Mail
description: Enable or disable external parties to send emails to a Microsoft 365 group
---

## Description
This runbook configures whether external senders are allowed to email a Microsoft 365 group.
It uses Exchange Online to enable or disable the RequireSenderAuthenticationEnabled setting.
You can also query the current state without making changes.

## Location
Group → Mail → Enable Or Disable External Mail

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### GroupId

Object ID of the Microsoft 365 group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Action

"Enable External Mail" (final value: 0), "Disable External Mail" (final value: 1) or "Query current state only" (final value: 2) can be selected as action to perform. If set to 0, the runbook will allow external senders to email the group. If set to 1, it will block external senders from emailing the group. If set to 2, it will return whether external mailing is currently enabled or disabled for the group without making any changes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |



[Back to Runbook Reference overview](../../README.md)

