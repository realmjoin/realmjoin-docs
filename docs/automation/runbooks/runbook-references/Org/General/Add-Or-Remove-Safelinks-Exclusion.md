# Add Or Remove Safelinks Exclusion

Add or remove a SafeLinks URL exclusion to/from a given policy.

## Description

Add or remove a SafeLinks URL exclusion to/from a given policy.
It can also be used to initially create a new policy if required.

## Location

Org &rarr; General &rarr; Add Or Remove Safelinks Exclusion

## Permissions

### API Permissions

**Office 365 Exchange Online**
- Exchange.ManageAsApp

### Required Roles

- Exchange administrator

## Parameters

### -Action

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _2_ |
| Required | _false_ |
| Position | _1_ |

### -LinkPattern

**Description:** URL to allow, can contain '*' as wildcard for host and paths 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _https://*.microsoft.com/*_ |
| Required | _false_ |
| Position | _2_ |

### -DefaultPolicyName

**Description:** If only one policy exists, no need to specify. Will use "DefaultPolicyName" as default otherwise. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Default SafeLinks Policy_ |
| Required | _true_ |
| Position | _3_ |

### -PolicyName

**Description:** Optional, will overwrite default values 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _4_ |

### -CreateNewPolicyIfNeeded

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


