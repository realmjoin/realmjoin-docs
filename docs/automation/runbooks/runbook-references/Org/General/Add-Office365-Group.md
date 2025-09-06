# Add Office365 Group

Create an Office 365 group and SharePoint site, optionally create a (Teams) team.

## Description

Create an Office 365 group and SharePoint site, optionally create a (Teams) team.

## Location

Org &rarr; General &rarr; Add Office365 Group

## Notes

Permissions (according to https://docs.microsoft.com/en-us/graph/api/group-post-groups?view=graph-rest-1.0 )
MS Graph (API):
- Group.Create
- Team.Create

## Permissions

### API Permissions

**Microsoft Graph**
- Group.Create
- Team.Create

## Parameters

### -MailNickname

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -DisplayName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _2_ |

### -CreateTeam

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _3_ |

### -Private

**Description:** [ValidateScript( { Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process; Use-RJInterface -DisplayName "Group is private" } )] 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _4_ |

### -MailEnabled

**Description:** [ValidateScript( { Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process; Use-RJInterface -DisplayName "Group is mail-enabled" } )] 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _5_ |

### -SecurityEnabled

**Description:** [ValidateScript( { Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process; Use-RJInterface -DisplayName "Group is security-enabled" } )] 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _6_ |

### -Owner

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _7_ |

### -Owner2

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _8_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _9_ |


