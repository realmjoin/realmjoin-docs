# Add Or Remove Teams Mailcontact

Create/Remove a contact, to allow pretty email addresses for Teams channels.

## Description

Create/Remove a contact, to allow pretty email addresses for Teams channels.

## Location

Org &rarr; Mail &rarr; Add Or Remove Teams Mailcontact

## Permissions

### API Permissions

**Office 365 Exchange Online**
- Exchange.ManageAsApp

### Required Roles

- Exchange administrator

## Parameters

### -RealAddress

**Description:** Enter the address created by MS Teams for a channel 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -DesiredAddress

**Description:** Will forward/relay to the real address. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -DisplayName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |

### -Remove

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _4_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _5_ |


