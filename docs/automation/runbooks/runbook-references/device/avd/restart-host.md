---
title: Restart Host
description: Restart this AVD session host and return it to service
---

## Description
Restarts this Azure Virtual Desktop session host. Signed-in users are disconnected. Drain mode is switched on first so no new sessions land on the host. A stopped host is started instead of rebooted. Once the host runs again, drain mode is switched off.

## Location
Device → AVD → Restart Host

**Full Runbook name**

rjgit-device_AVD_restart-host

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Az.DesktopVirtualization (>= 6.0.0)<br>Az.Accounts (>= 5.5.2)<br>Az.Compute (>= 11.8.0) |
| Schedulable | no |

## Permissions

### Permission notes
Azure: Desktop Virtualization Host Pool Contributor and Virtual Machine Contributor on Subscription which contains the Hostpool


## Parameters
### DeviceName

Name of the AVD session host. Set by the portal from the selected device.

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

