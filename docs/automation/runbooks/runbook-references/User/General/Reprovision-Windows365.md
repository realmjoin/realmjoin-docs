# Reprovision Windows365

Reprovision a Windows 365 Cloud PC

## Description

Reprovision an already existing Windows 365 Cloud PC without reassigning a new instance for this user.

## Location

User &rarr; General &rarr; Reprovision Windows365

## Permissions

### API Permissions

**Microsoft Graph**
- GroupMember.ReadWrite.All
- Group.ReadWrite.All
- Directory.Read.All
- CloudPC.ReadWrite.All
- User.Read.All
- User.SendMail

## Parameters

### -UserName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -licWin365GroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB_ |
| Required | _true_ |
| Position | _2_ |

### -sendMailWhenReprovisioning

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _3_ |

### -fromMailAddress

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _reports@contoso.com_ |
| Required | _false_ |
| Position | _4_ |

### -customizeMail

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _5_ |

### -customMailMessage

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Insert Custom Message here. (Capped at 3000 characters)_ |
| Required | _false_ |
| Position | _6_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _7_ |


