# User Signout

Removes (Signs Out) a specific User from their AVD Session.

## Description

This Runbooks looks for active User Sessions in all AVD Hostpools of a tenant and removes forces a Sign-Out of the user.
The SubscriptionIds value must be defined in the runbooks customization.

## Location

User &rarr; Avd &rarr; User Signout

## Permissions

No specific permissions documented.

## Parameters

### -UserName

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


