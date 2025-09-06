# Set Out Of Office

En-/Disable Out-of-office-notifications for a user/mailbox.

## Description

En-/Disable Out-of-office-notifications for a user/mailbox.

## Location

User &rarr; Mail &rarr; Set Out Of Office

## Permissions

### API Permissions

**Office 365 Exchange Online API**
- Exchange.ManageAsApp

### Required Roles

- Exchange administrator

## Parameters

### -UserName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -Disable

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _2_ |

### -Start

| Name | Value |
|---|---|
| Type | _DateTime_ |
| Default Value | _(get-date)_ |
| Required | _false_ |
| Position | _3_ |

### -End

**Description:** 10 years into the future ("forever") if left empty 

| Name | Value |
|---|---|
| Type | _DateTime_ |
| Default Value | _((get-date) + (new-timespan -Days 3650))_ |
| Required | _false_ |
| Position | _4_ |

### -MessageInternal

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Sorry, this person is currently not able to receive your message._ |
| Required | _false_ |
| Position | _5_ |

### -MessageExternal

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Sorry, this person is currently not able to receive your message._ |
| Required | _false_ |
| Position | _6_ |

### -CreateEvent

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _7_ |

### -EventSubject

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Out of Office_ |
| Required | _false_ |
| Position | _8_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _9_ |


