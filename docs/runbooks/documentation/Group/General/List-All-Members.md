# List All Members

Retrieves the members of a specified EntraID group, including members from nested groups.

## Description

This script retrieves the members of a specified EntraID group, including both direct members and those from nested groups.
The output is a CSV file with columns for User Principal Name (UPN), direct membership status, and group path.
The group path reflects the membership hierarchy—for example, “Primary, Secondary” if a user belongs to “Primary” via the nested group “Secondary.”

## Location

Group &rarr; General &rarr; List All Members

## Permissions

### API Permissions

**Microsoft Graph**
- Group.Read.All
- User.Read.All

## Parameters

### -GroupId

**Description:** The ObjectId of the EntraID group whose membership is to be retrieved. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -CallerName

**Description:** The name of the caller, used for auditing purposes. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _2_ |


