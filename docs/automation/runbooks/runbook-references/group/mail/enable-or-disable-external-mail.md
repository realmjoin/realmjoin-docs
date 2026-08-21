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

**Full Runbook name**

rjgit-group_mail_enable-or-disable-external-mail

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | ExchangeOnlineManagement (>= 3.9.2)<br>RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Notes
Setting this via Microsoft Graph is broken as of 2021-06-28.
Attribute: allowExternalSenders.
See https://docs.microsoft.com/en-us/graph/known-issues#setting-the-allowexternalsenders-property.

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Runs Get-/Set-UnifiedGroup to toggle RequireSenderAuthenticationEnabled in the app-only session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session changing the external mail setting*


## Parameters
### GroupId

Object ID of the Microsoft 365 group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Action

"Enable External Mail" (final value: 0), "Disable External Mail" (final value: 1) or "Query current state only" (final value: 2) can be selected as action to perform. If set to 0, the runbook will allow external senders to email the group. If set to 1, it will block external senders from emailing the group. If set to 2, it will return whether external mailing is currently enabled or disabled for the group without making any changes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Choose action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Enable External Mail | 0 |
| Disable External Mail | 1 |
| Query current state only | 2 |



[Back to Runbook Reference overview](../../README.md)

