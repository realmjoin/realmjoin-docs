---
title: Add Distribution List
description: Create a classic distribution group
---

## Description
Creates a classic Exchange Online distribution group with optional owner configuration. If no primary SMTP address is provided, the default verified domain is used.

## Location
Organization → Mail → Add Distribution List

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

### PrimarySMTPAddress

Optional primary SMTP address for the distribution group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GroupName

Optional display name for the distribution group; defaults to the alias.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Owner

Optional owner who can manage the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Roomlist

If set to true, the distribution group is created as a room list.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### AllowExternalSenders

If set to true, the group can receive email from external senders.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

