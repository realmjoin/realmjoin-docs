---
title: Add Office365 Group
description: Create an Office 365 group and SharePoint site, optionally create a (Teams) team.
---

## Description
Create an Office 365 group and SharePoint site, optionally create a (Teams) team.

## Location
Organization → General → Add Office365 Group

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.Create
  - Team.Create


## Parameters
### MailNickname



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DisplayName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CreateTeam



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### Private

[ValidateScript( { Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process; Use-RJInterface -DisplayName "Group is private" } )]

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### MailEnabled

[ValidateScript( { Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process; Use-RJInterface -DisplayName "Group is mail-enabled" } )]

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### SecurityEnabled

[ValidateScript( { Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process; Use-RJInterface -DisplayName "Group is security-enabled" } )]

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### Owner



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Owner2



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

