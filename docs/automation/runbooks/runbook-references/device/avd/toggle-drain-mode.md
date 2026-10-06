---
title: Toggle Drain Mode
description: Enable or disable drain mode on this AVD session host
---

## Description
Switches drain mode for this Azure Virtual Desktop session host, whichever host pool of the tenant it belongs to. With drain mode on, the host accepts no new sessions, for example before maintenance; existing sessions stay connected. With drain mode off, the host takes new sessions again.

## Location
Device → AVD → Toggle Drain Mode

**Full Runbook name**

rjgit-device_AVD_toggle-drain-mode

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
### DeviceName

Name of the AVD session host. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### DrainMode

Whether the host should stop accepting new sessions (drain mode on) or take new sessions again (drain mode off).

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | Boolean |
| Portal display name | Drain mode |

**Portal options**

| Portal option | Value |
| --- | --- |
| On - stop accepting new sessions | true |
| Off - accept new sessions again | false |

### SubscriptionIds

Azure subscriptions that hold the AVD host pools. Taken from the tenant setting AVD.SubscriptionIds.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String[] |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

