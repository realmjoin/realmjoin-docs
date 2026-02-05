---
title: Add Room Mailbox
description: Create a room resource.
---

## Description
Create a room resource.

## Location
Organization → Mail → Add Room Mailbox

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### MailboxName



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

### DelegateTo



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Capacity



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

### AutoAccept



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### AutoMapping



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### DisableUser

CallerName is tracked purely for auditing purposes

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

