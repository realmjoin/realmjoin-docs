---
title: User Signout
description: Sign this user out of their AVD sessions
---

## Description
Finds the Azure Virtual Desktop sessions of this user, active or disconnected, in all host pools of the configured subscriptions and signs the user out of them. Unsaved work in those sessions is lost.

## Location
User → AVD → User Signout

**Full Runbook name**

rjgit-user_AVD_user-signout

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Az.DesktopVirtualization (>= 6.0.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | no |

## Permissions

### Permission notes
Azure: Desktop Virtualization Host Pool Contributor on Subscription which contains the Hostpool


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### SubscriptionIds

Azure subscriptions that hold the AVD host pools. Taken from the tenant setting AVD.SubscriptionIds.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String[] |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

