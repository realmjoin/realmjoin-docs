# Resize Windows365

Resize a Windows 365 Cloud PC

## Description

Resize an already existing Windows 365 Cloud PC by derpovisioning and assigning a new differently sized license to the user. Warning: All local data will be lost. Proceed with caution.

## Location

User &rarr; General &rarr; Resize Windows365

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

### -currentLicWin365GroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB_ |
| Required | _true_ |
| Position | _2_ |

### -newLicWin365GroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB_ |
| Required | _true_ |
| Position | _3_ |

### -sendMailWhenDoneResizing

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _4_ |

### -fromMailAddress

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _reports@contoso.com_ |
| Required | _false_ |
| Position | _5_ |

### -customizeMail

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _6_ |

### -customMailMessage

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Insert Custom Message here. (Capped at 3000 characters)_ |
| Required | _false_ |
| Position | _7_ |

### -cfgProvisioningGroupPrefix

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _cfg - Windows 365 - Provisioning -_ |
| Required | _false_ |
| Position | _8_ |

### -cfgUserSettingsGroupPrefix

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _cfg - Windows 365 - User Settings -_ |
| Required | _false_ |
| Position | _9_ |

### -unassignRunbook

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _rjgit-user_general_unassign-windows365_ |
| Required | _false_ |
| Position | _10_ |

### -assignRunbook

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _rjgit-user_general_assign-windows365_ |
| Required | _false_ |
| Position | _11_ |

### -skipGracePeriod

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _12_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _13_ |


