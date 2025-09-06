# Unassign Windows365

Remove/Deprovision a Windows 365 instance

## Description

Remove/Deprovision a Windows 365 instance

## Location

User &rarr; General &rarr; Unassign Windows365

## Permissions

### API Permissions

**Microsoft Graph**
- User.Read.All
- GroupMember.ReadWrite.All
- Group.ReadWrite.All
- CloudPC.ReadWrite.All

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
| Required | _false_ |
| Position | _2_ |

### -cfgProvisioningGroupPrefix

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _cfg - Windows 365 - Provisioning -_ |
| Required | _false_ |
| Position | _3_ |

### -cfgUserSettingsGroupPrefix

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _cfg - Windows 365 - User Settings -_ |
| Required | _false_ |
| Position | _4_ |

### -licWin365GroupPrefix

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _lic - Windows 365 Enterprise -_ |
| Required | _false_ |
| Position | _5_ |

### -skipGracePeriod

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _6_ |

### -KeepUserSettingsAndProvisioningGroups

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _7_ |

### -CallerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _8_ |


