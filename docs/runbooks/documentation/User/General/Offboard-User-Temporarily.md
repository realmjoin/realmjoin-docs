# Offboard User Temporarily

Temporarily offboard a user.

## Description

Temporarily offboard a user in cases like parental leaves or sabaticals.

## Location

User &rarr; General &rarr; Offboard User Temporarily

## Permissions

### API Permissions

**Microsoft Graph**
- User.ReadWrite.All
- Group.ReadWrite.All
- Directory.ReadWrite.All

### Required Roles

- User administrator

### Manual Permissions

- Azure IaaS: Contributor access on subscription or resource group used for the export

## Parameters

### -UserName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -RevokeAccess

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _2_ |

### -DisableUser

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _3_ |

### -exportResourceGroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _4_ |

### -exportStorAccountName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _5_ |

### -exportStorAccountLocation

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _6_ |

### -exportStorAccountSKU

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _7_ |

### -exportStorContainerGroupMembershipExports

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _8_ |

### -exportGroupMemberships

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _9_ |

### -ChangeLicensesSelector

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _0_ |
| Required | _false_ |
| Position | _10_ |

### -ChangeGroupsSelector

**Description:** "Change" and "Remove all" will both honour "groupToAdd" 

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _0_ |
| Required | _false_ |
| Position | _11_ |

### -GroupToAdd

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _12_ |

### -GroupsToRemovePrefix

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _13_ |

### -RevokeGroupOwnership

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _14_ |

### -ReplacementOwnerName

**Description:** Who will take over group ownership if the offboarded user is the last remaining group owner? Will only be used if needed. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _15_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _16_ |


