# Restart Host

Reboots a specific AVD Session Host.

## Description

This Runbook reboots a specific AVD Session Host. If Users are signed in, they will be disconnected. In any case, Drain Mode will be enabled and the Session Host will be restarted.
If the SessionHost is not running, it will be started. Once the Session Host is running, Drain Mode is disabled again.

## Location

Device &rarr; Avd &rarr; Restart Host

## Permissions

No specific permissions documented.

## Parameters

### -DeviceName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -SubscriptionIds

| Name | Value |
|---|---|
| Type | _String[]_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -CallerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _3_ |


