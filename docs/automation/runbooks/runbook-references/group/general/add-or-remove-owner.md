---
title: Add Or Remove Owner
description: Add/remove owners to/from an Office 365 group.
---

## Description
Add/remove owners to/from an Office 365 group.

## Location
Group → General → Add Or Remove Owner

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - Group.ReadWrite.All
  - GroupMember.ReadWrite.All
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### GroupID

[ValidateScript( { Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process; Use-RJInterface -Type Graph -Entity Group -DisplayName "Group" } )]

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### UserId



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |


[Back to Table of Content](../../README.md)

