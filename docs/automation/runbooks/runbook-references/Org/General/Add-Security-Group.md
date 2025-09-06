# Add Security Group

This runbook creates a Microsoft Entra ID security group with membership type "Assigned".

## Description

This runbook creates a Microsoft Entra ID security group with membership type "Assigned".

## Location

Org &rarr; General &rarr; Add Security Group

## Notes

AssignableToRoles is currently deactivated, as extended rights are required.
“RoleManagement.ReadWrite.Directory” permission is required to set the ‘isAssignableToRole’ property or update the membership of such groups.
Reference is made to this in a comment in the course of the code.
(according to https://learn.microsoft.com/en-us/graph/api/group-post-groups?view=graph-rest-1.0&tabs=http#example-3-create-a-microsoft-365-group-that-can-be-assigned-to-a-microsoft-entra-role)
Also to reactivate this feature, the following extra is in the .INPUTS are required:
"AssignableToRoles": {
    "DisplayName":  "Microsoft Entra roles can be assigned to the group"
},

## Permissions

### API Permissions

**Microsoft Graph**
- Group.Create

## Parameters

### -GroupName

**Description:** The name of the security group. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -GroupDescription

**Description:** The description of the security group. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _2_ |

### -Owner

**Description:** The owner of the security group. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
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


