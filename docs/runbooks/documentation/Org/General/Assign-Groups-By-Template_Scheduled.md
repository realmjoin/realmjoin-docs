# Assign Groups By Template_Scheduled

Assign cloud-only groups to many users based on a predefined template.

## Description

Assign cloud-only groups to many users based on a predefined template.

## Location

Org &rarr; General &rarr; Assign Groups By Template_Scheduled

## Permissions

No specific permissions documented.

## Parameters

### -SourceGroupId

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -ExclusionGroupId

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _2_ |

### -GroupsTemplate

**Description:** GroupsTemplate is not used directly, but is used to populate the GroupsString parameter via RJ Portal Customization 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |

### -GroupsString

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _4_ |

### -UseDisplaynames

**Description:** $UseDisplayname = $false: GroupsString contains Group object ids, $true: GroupsString contains Group displayNames 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _5_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _6_ |


