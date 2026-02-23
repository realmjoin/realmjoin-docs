---
title: Add Office365 Group
description: Create an Office 365 group and SharePoint site, optionally create a (Teams) team.
---

## Description
This runbook creates a Microsoft 365 group and provisions the related SharePoint site.
It can optionally promote the group to a Microsoft Teams team after creation.

## Location
Organization → General → Add Office365 Group

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.Create
  - Team.Create


## Parameters
### MailNickname

Mail nickname used for group creation.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DisplayName

Optional display name. If empty, MailNickname is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CreateTeam

Choose to "Only create a SharePoint Site" (final value: $false) or "Create a Team (and SharePoint Site)" (final value: $true). A team needs an owner, so if CreateTeam is set to true and no owner is specified, the runbook will set the caller as the owner.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### Private

Choose the group visibility: "Public" (final value: $false) or "Private" (final value: $true).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### MailEnabled

If set to true, the group is mail-enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### SecurityEnabled

If set to true, the group is security-enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### Owner

Optional owner of the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Owner2

Optional second owner of the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

