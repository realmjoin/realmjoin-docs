---
title: Restart Host
description: Reboots a specific AVD Session Host.
---

## Description
This Runbook reboots a specific AVD Session Host. If Users are signed in, they will be disconnected. In any case, Drain Mode will be enabled and the Session Host will be restarted.
If the SessionHost is not running, it will be started. Once the Session Host is running, Drain Mode is disabled again.

## Location
Device → AVD → Restart Host

## Permissions
### Permission notes
Azure: Desktop Virtualization Host Pool Contributor and Virtual Machine Contributor on Subscription which contains the Hostpool


## Parameters
### DeviceName

The name of the AVD Session Host device to restart. Hidden in UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### SubscriptionIds

Array of Azure subscription IDs where the AVD Session Host resources are located. Retrieved from AVD.SubscriptionIds setting (Customization). Hidden in UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String[] |


[Back to Table of Content](../../README.md)

