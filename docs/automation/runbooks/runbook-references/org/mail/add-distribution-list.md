---
title: Add Distribution List
description: Create a classic distribution group
---

## Description
Creates a classic Exchange Online distribution group with optional owner configuration. If no primary SMTP address is provided, the default verified domain is used.

## Location
Organization → Mail → Add Distribution List

**Full Runbook name**

rjgit-org_mail_add-distribution-list

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>ExchangeOnlineManagement (>= 3.9.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### Alias

Mail alias (mail nickname) for the distribution group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Alias: A shorter, more concise name for the Distribution List that is usually the first part of the email address (in front of the "@" sign). 
Example: "MarketingTeam@company.com" could have an alias "MKTG" for convenience. |

### PrimarySMTPAddress

Optional primary SMTP address for the distribution group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Desired email address: Primary email address of the Distribution List that will be used to send emails from. If left unfilled will use the default domain as a primary SMTP address. |

### GroupName

Optional display name for the distribution group; defaults to the alias.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Group Name: As displayed in the address book of your mailing system for easier searching. |

### Owner

Optional owner who can manage the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Group Owner: User that will manage the members of the Distribution List (add, remove, etc.). |

### Roomlist

If set to true, the distribution group is created as a room list.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Create as Roomlist |

### AllowExternalSenders

If set to true, the group can receive email from external senders.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Can receive external mail |



[Back to Runbook Reference overview](../../README.md)

