---
title: Set Room Mailbox Configuration
description: Set room resource policies.
---

## Description
Set room resource policies.

## Location
User → Mail → Set Room Mailbox Configuration

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

### AllBookInPolicy



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookInPolicyGroup



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### AllowRecurringMeetings



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### AutomateProcessing



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | AutoAccept |
| Type | String |

### BookingWindowInDays



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 180 |
| Type | Int32 |

### MaximumDurationInMinutes



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1440 |
| Type | Int32 |

### AllowConflicts



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### Capacity



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |



[Back to Runbook Reference overview](../../README.md)

