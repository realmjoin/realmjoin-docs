---
title: Assign Owa Mailbox Policy
description: Assign an OWA mailbox policy to a user
---

## Description
Assigns an OWA mailbox policy to a mailbox in Exchange Online.
This can be used to enable or restrict features such as the ability to use email signatures in OWA or to enable the Bookings add-in for users who create Bookings appointments.

## Location
User → Mail → Assign Owa Mailbox Policy

## Permissions
### RBAC roles
- Exchange administrator


## Parameters
### UserName

User principal name of the target mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### OwaPolicyName

Name of the OWA mailbox policy to assign.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | OwaMailboxPolicy-Default |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

