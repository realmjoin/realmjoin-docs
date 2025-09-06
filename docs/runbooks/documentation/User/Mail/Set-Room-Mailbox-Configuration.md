# Set Room Mailbox Configuration

Set room resource policies.

## Description

Set room resource policies.

## Location

User &rarr; Mail &rarr; Set Room Mailbox Configuration

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

### -AllBookInPolicy

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _2_ |

### -BookInPolicyGroup

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |

### -AllowRecurringMeetings

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _4_ |

### -AutomateProcessing

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _AutoAccept_ |
| Required | _false_ |
| Position | _5_ |

### -BookingWindowInDays

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _180_ |
| Required | _false_ |
| Position | _6_ |

### -MaximumDurationInMinutes

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _1440_ |
| Required | _false_ |
| Position | _7_ |

### -AllowConflicts

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _8_ |

### -Capacity

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _0_ |
| Required | _false_ |
| Position | _9_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _10_ |


