---
title: User Signout
description: Removes (Signs Out) a specific User from their AVD Session.
---

## Description
This Runbooks looks for active User Sessions in all AVD Hostpools of a tenant and removes forces a Sign-Out of the user.
The SubscriptionIds value must be defined in the runbooks customization.

## Location
User → AVD → User Signout

**Full Runbook name**

rjgit-user_AVD_user-signout

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>Az.DesktopVirtualization (>= 5.4.1)<br>Az.Accounts (>= 5.1.1) |
| Schedulable | no |

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
| Hidden in portal | yes (preset via runbook customization) |

### SubscriptionIds

Array of Azure subscription IDs where the AVD resources are located. Retrieved from AVD.SubscriptionIds setting (Customization). Hidden in UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String[] |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

