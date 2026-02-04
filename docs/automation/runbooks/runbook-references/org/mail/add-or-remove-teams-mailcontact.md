---
title: Add Or Remove Teams Mailcontact
description: Create/Remove a contact, to allow pretty email addresses for Teams channels.
---

## Description
Create/Remove a contact, to allow pretty email addresses for Teams channels.

## Location
Organization → Mail → Add Or Remove Teams Mailcontact

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### RealAddress

Enter the address created by MS Teams for a channel

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DesiredAddress

Will forward/relay to the real address.

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

### Remove



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |


[Back to Table of Content](../../README.md)

