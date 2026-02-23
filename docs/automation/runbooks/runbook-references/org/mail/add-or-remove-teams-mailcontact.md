---
title: Add Or Remove Teams Mailcontact
description: Create/Remove a contact, to allow pretty email addresses for Teams channels.
---

## Description
Creates or updates a mail contact so a desired email address relays to the real Teams channel email address. The runbook can also remove the desired relay address again.

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

Desired email address that should relay to the real address.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DisplayName

Optional display name for the contact in the address book.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Remove

"Relay the desired address to the real address" (final value: $false) or "Stop the relay and remove desired address" (final value: $true) can be selected as action to perform.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

