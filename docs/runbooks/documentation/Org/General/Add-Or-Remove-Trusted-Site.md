# Add Or Remove Trusted Site

Add/Remove an entry to/from the Intune Windows 10 Trusted Sites Policy

## Description

Add/Remove an entry to/from the Intune Windows 10 Trusted Sites Policy

## Location

Org &rarr; General &rarr; Add Or Remove Trusted Site

## Notes

This runbook uses calls as described in
https://call4cloud.nl/2021/09/the-isencrypted-with-steve-zissou/
to decrypt omaSettings. It currently needs to use the MS Graph Beta Endpoint for this.
Please switch to "v1.0" as soon, as this funtionality is available.

## Permissions

### API Permissions

**Microsoft Graph**
- DeviceManagementConfiguration.ReadWrite.All

## Parameters

### -Action

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _2_ |
| Required | _true_ |
| Position | _1_ |

### -Url

**Description:** Needs to be prefixed with "http://" or "https://" 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _2_ |

### -Zone

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _1_ |
| Required | _false_ |
| Position | _3_ |

### -DefaultPolicyName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _Windows 10 - Trusted Sites_ |
| Required | _false_ |
| Position | _4_ |

### -IntunePolicyName

**Description:** Will use an existing policy or default policy name if left empty. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
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


