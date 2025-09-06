# Assign Windows365

Assign/Provision a Windows 365 instance

## Description

Assign/Provision a Windows 365 instance for this user.

## Location

User &rarr; General &rarr; Assign Windows365

## Permissions

### API Permissions

**Microsoft Graph**
- User.Read.All
- GroupMember.ReadWrite.All
- Group.ReadWrite.All
- User.SendMail

## Parameters

### -UserName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -cfgProvisioningGroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _cfg - Windows 365 - Provisioning - Win11_ |
| Required | _false_ |
| Position | _2_ |

### -cfgUserSettingsGroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _cfg - Windows 365 - User Settings - restore allowed_ |
| Required | _false_ |
| Position | _3_ |

### -licWin365GroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB_ |
| Required | _false_ |
| Position | _4_ |

### -cfgProvisioningGroupPrefix

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _cfg - Windows 365 - Provisioning -_ |
| Required | _false_ |
| Position | _5_ |

### -cfgUserSettingsGroupPrefix

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _cfg - Windows 365 - User Settings -_ |
| Required | _false_ |
| Position | _6_ |

### -sendMailWhenProvisioned

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _7_ |

### -customizeMail

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _8_ |

### -customMailMessage

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Insert Custom Message here. (Capped at 3000 characters)_ |
| Required | _false_ |
| Position | _9_ |

### -createTicketOutOfLicenses

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _10_ |

### -ticketQueueAddress

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _support@glueckkanja-gab.com_ |
| Required | _false_ |
| Position | _11_ |

### -fromMailAddress

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _runbooks@contoso.com_ |
| Required | _false_ |
| Position | _12_ |

### -ticketCustomerId

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Contoso_ |
| Required | _false_ |
| Position | _13_ |

### -CallerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _14_ |


