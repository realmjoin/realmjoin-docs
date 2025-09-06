# Add Viva Engange Community

Creates a Viva Engage (Yammer) community via the Yammer API

## Description

Creates a Viva Engage (Yammer) community using a Yammer dev token. The API-calls used are subject to change, so this script might break in the future.

## Location

Org &rarr; General &rarr; Add Viva Engange Community

## Permissions

No specific permissions documented.

## Parameters

### -CommunityName

**Description:** The name of the community to create. max 264 chars. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Sample Community_ |
| Required | _true_ |
| Position | _1_ |

### -CommunityPrivate

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _false_ |
| Position | _2_ |

### -CommunityShowInDirectory

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _3_ |

### -CommunityOwners

**Description:** The owners of the community. Comma seperated list of UPNs. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _4_ |

### -removeCreatorFromGroup

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _5_ |

### -CallerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _6_ |


