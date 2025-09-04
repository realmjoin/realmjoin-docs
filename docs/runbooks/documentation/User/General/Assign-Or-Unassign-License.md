# Assign Or Unassign License

(Un-)Assign a license to a user via group membership.

## Description

(Un-)Assign a license to a user via group membership.

## Location

User &rarr; General &rarr; Assign Or Unassign License

## Permissions

### API Permissions

**Microsoft Graph**
- User.Read.All
- GroupMember.ReadWrite.All
- Group.ReadWrite.All

## Parameters

### -UserName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -GroupID_License

**Description:** production does not supprt "ref:LicenseGroup" yet 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -Remove

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _3_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _4_ |


