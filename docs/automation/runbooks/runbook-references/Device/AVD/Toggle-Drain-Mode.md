# Toggle Drain Mode

Sets Drainmode on true or false for a specific AVD Session Host.

## Description

This Runbooks looks through all AVD Hostpools of a tenant and sets the DrainMode for a specific Session Host.
The SubscriptionId value must be defined in the runbooks customization.

## Location

Device &rarr; Avd &rarr; Toggle Drain Mode

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

### -DrainMode

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _true_ |
| Position | _2_ |

### -SubscriptionIds

| Name | Value |
|---|---|
| Type | _String[]_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _3_ |

### -CallerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _4_ |


