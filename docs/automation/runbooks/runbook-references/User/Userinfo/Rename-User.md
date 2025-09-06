# Rename User

Rename a user or mailbox. Will not update metadata like DisplayName, GivenName, Surname.

## Description

Rename a user or mailbox. Will not update metadata like DisplayName, GivenName, Surname.

## Location

User &rarr; Userinfo &rarr; Rename User

## Permissions

### API Permissions

**Microsoft Graph**
- Directory.Read.All
- User.ReadWrite.All

**Office 365 Exchange Online**
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

### -NewUpn

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -ChangeMailnickname

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _3_ |

### -UpdatePrimaryAddress

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _4_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes
Currently, removing the old eMail-address "in one go" seems not to work reliably
[bool] $RemoveOldAddress = $false 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _5_ |


