---
title: Add Distribution List
description: Create a classic Exchange Online distribution group
---

## Description
Creates a classic distribution group in Exchange Online, optionally as a room list, with an owner, or open to external senders. Without an email address the alias at the default domain of the tenant is used.

## Location
Organization → Mail → Add Distribution List

**Full Runbook name**

rjgit-org_mail_add-distribution-list

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All
    - *Reads the tenant's verified domains to pick the default domain for the SMTP address*
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Runs New-DistributionGroup in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session to create distribution groups*


## Parameters
### Alias

Short name that becomes the part of the email address in front of the @ sign, for example MKTG for the marketing team.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Alias |

### PrimarySMTPAddress

Address the group sends and receives with. Leave empty to use the alias at the default domain.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Email address |

### GroupName

Name shown in the address book. Leave empty to use the alias.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Group name |

### Owner

User who manages the members of the group. Leave empty for none.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Group owner |

### Roomlist

Creates the group as a room list, so its rooms can be picked together in the Outlook room finder.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Create as a room list? |

### AllowExternalSenders

Lets people outside the organization send email to the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Allow external senders? |



[Back to Runbook Reference overview](../../README.md)

