---
title: User Signout
description: Removes (Signs Out) a specific User from their AVD Session.
---

## Description
This Runbooks looks for active User Sessions in all AVD Hostpools of a tenant and removes forces a Sign-Out of the user.
The SubscriptionIds value must be defined in the runbooks customization.

## Location
User → AVD → User Signout

## Permissions
### Permission notes
Azure: Desktop Virtualization Host Pool Contributor on Subscription which contains the Hostpool


## Parameters
### UserName

The username (UPN) of the user to sign out from their AVD session. Hidden in UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### SubscriptionIds

Array of Azure subscription IDs where the AVD resources are located. Retrieved from AVD.SubscriptionIds setting (Customization). Hidden in UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String[] |



[Back to Runbook Reference overview](../../README.md)

