---
title: Rename User
description: Rename a user or mailbox. Will not update metadata like DisplayName, GivenName, Surname.
---

## Description
Rename a user or mailbox. Will not update metadata like DisplayName, GivenName, Surname.

## Location
User → Userinfo → Rename User

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Directory.Read.All
  - User.ReadWrite.All
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### UserName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### NewUpn



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### ChangeMailnickname



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### UpdatePrimaryAddress



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

