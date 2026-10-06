---
title: Enable Or Disable External Mail
description: Allow or block external senders for this Microsoft 365 group
---

## Description
Controls whether people outside the organization can send email to this Microsoft 365 group. The current setting can also be shown without changing it.

## Implementation notes

The setting is changed through Exchange Online (`RequireSenderAuthenticationEnabled`), not through Microsoft Graph. Writing the corresponding `allowExternalSenders` property of the group via Microsoft Graph is a documented known issue (as of 2021-06-28), see [Setting the allowExternalSenders property](https://docs.microsoft.com/en-us/graph/known-issues#setting-the-allowexternalsenders-property).


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

Object ID of the group the runbook acts on. Set by the portal from the selected group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### Action

Allow lets external senders email the group. Block limits it to internal senders. Query only shows the current state.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Allow external senders | 0 |
| Block external senders | 1 |
| Query current state only | 2 |



[Back to Runbook Reference overview](../../README.md)

