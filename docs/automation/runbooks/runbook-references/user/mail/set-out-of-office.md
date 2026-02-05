---
title: Set Out Of Office
description: En-/Disable Out-of-office-notifications for a user/mailbox.
---

## Description
En-/Disable Out-of-office-notifications for a user/mailbox.

## Location
User → Mail → Set Out Of Office

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online API
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

### Disable



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### Start



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | (get-date) |
| Type | DateTime |

### End

10 years into the future ("forever") if left empty

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | ((get-date) + (new-timespan -Days 3650)) |
| Type | DateTime |

### MessageInternal



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Sorry, this person is currently not able to receive your message. |
| Type | String |

### MessageExternal



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Sorry, this person is currently not able to receive your message. |
| Type | String |

### CreateEvent



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### EventSubject



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Out of Office |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

