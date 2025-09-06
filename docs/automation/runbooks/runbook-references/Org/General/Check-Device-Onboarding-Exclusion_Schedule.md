# Check Device Onboarding Exclusion_Schedule

Check for Autopilot devices not yet onboarded to Intune. Add these to an exclusion group.

## Description

Check for Autopilot devices not yet onboarded to Intune. Add these to an exclusion group.

## Location

Org &rarr; General &rarr; Check Device Onboarding Exclusion_Schedule

## Permissions

No specific permissions documented.

## Parameters

### -exclusionGroupName

**Description:** EntraID exclusion group for Defender Compliance. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _cfg - Intune - Windows - Compliance for unenrolled Autopilot devices (devices)_ |
| Required | _false_ |
| Position | _1_ |

### -maxAgeInDays

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _1_ |
| Required | _false_ |
| Position | _2_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _3_ |


