# Assign Groups By Template

Assign cloud-only groups to a user based on a predefined template.

## Description

Assign cloud-only groups to a user based on a predefined template.

## Location

User &rarr; General &rarr; Assign Groups By Template

## Permissions

No specific permissions documented.

## Parameters

### -UserId

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -GroupsTemplate

**Description:** GroupsTemplate is not used directly, but is used to populate the GroupsString parameter via RJ Portal Customization 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _2_ |

### -GroupsString

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _3_ |

### -UseDisplaynames

**Description:** $UseDisplayname = $false: GroupsString contains Group object ids, $true: GroupsString contains Group displayNames 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _4_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _5_ |


