---
title: Add Office365 Group
description: Create a Microsoft 365 group, optionally with a team
---

## Description
Creates a Microsoft 365 group with its SharePoint site and, on request, turns it into a Microsoft Teams team. Visibility, mail and security settings and up to two owners can be set. A team without an owner gets the caller as owner.

## Location
Organization → General → Add Office365 Group

**Full Runbook name**

rjgit-org_general_add-office365-group

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.Create
    - *Creates the new Microsoft 365 group with visibility, mail settings and owner/member bindings*
  - Team.Create
    - *Promotes the group to a Teams team when CreateTeam is enabled*
  - Group.Read.All
    - *Checks for an existing group with the same mail nickname before creating*
  - User.Read.All *(optional — feature: Owner assignment)*
    - *Resolves the owner users via /users/{upn} when owners are provided*


## Parameters
### MailNickname

Alias of the group, used for its email address and SharePoint URL.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Mail nickname |

### DisplayName

Name shown for the group. Leave empty to use the mail nickname.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Display name |

### CreateTeam

Creates only the group with its SharePoint site, or also a Microsoft Teams team on top of it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Create a Teams team? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Only the group with its SharePoint site | false |
| Also a Microsoft Teams team | true |

### Private

Public groups can be found and joined by anyone in the organization, private groups only by their members.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Visibility |

**Portal options**

| Portal option | Value |
| --- | --- |
| Public | false |
| Private | true |

### MailEnabled

Gives the group a mailbox and email address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Mail-enabled? |

### SecurityEnabled

Lets the group be used for permissions and access assignments.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Security-enabled? |

### Owner

Owner of the group. Leave empty for none; a team then gets the caller as owner.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Owner2

Additional owner. Leave empty for none.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

