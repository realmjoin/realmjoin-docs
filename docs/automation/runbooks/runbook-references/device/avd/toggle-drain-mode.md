---
title: Toggle Drain Mode
description: Sets Drainmode on true or false for a specific AVD Session Host.
---

## Description
This Runbooks looks through all AVD Hostpools of a tenant and sets the DrainMode for a specific Session Host.
The SubscriptionId value must be defined in the runbooks customization.

## Location
Device → AVD → Toggle Drain Mode

## Permissions
### Permission notes
Azure: Desktop Virtualization Host Pool Contributor on Subscription which contains the Hostpool


## Parameters
### DeviceName

The name of the AVD Session Host device for which to toggle drain mode. Hidden in UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DrainMode

Boolean value to enable or disable Drain Mode. Set to true to enable Drain Mode (prevent new sessions), false to disable it (allow new sessions). Default is false.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | Boolean |

### SubscriptionIds

Array of Azure subscription IDs where the AVD Session Host resources are located. Retrieved from AVD.SubscriptionIds setting (Customization). Hidden in UI.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String[] |


[Back to Table of Content](../../README.md)

