---
title: Add Primary Users Of Devices To Group (Scheduled)
description: Sync primary users of Intune managed devices by platform into an Entra ID group
---

## Description
This runbook collects the primary users of all Intune managed devices matching the selected platform(s) and synchronizes them into a target Entra ID group. Users no longer assigned as primary user on any matching device are removed from the group. An optional include group restricts which users are eligible, and an optional exclude group prevents specific users from being added or keeps them removed.

## Location
Organization → General → Add Primary Users Of Devices To Group (Scheduled)

**Full Runbook name**

rjgit-org_general_add-primary-users-of-devices-to-group_scheduled

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
  - Group.Read.All
  - GroupMember.ReadWrite.All
  - User.Read.All


## Parameters
### TargetGroupId

The Entra ID group to synchronize primary users into. Members of this group will be managed exclusively by this runbook.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Windows

Include primary users of Windows devices. (OData Filter used "operatingSystem eq 'Windows'")

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### MacOS

Include primary users of macOS devices. (OData Filter used "operatingSystem eq 'macOS'")

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### iOS

Include primary users of iOS and iPadOS devices. (OData Filter used "operatingSystem eq 'iOS'")

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### Android

Include primary users of Android devices. (OData Filter used "operatingSystem eq 'Android'")

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### AdvancedFilter

Optional. Custom OData filter to apply when retrieving devices. Overrides the platform-based filters if provided. Example: startsWith(deviceName,'FWP-') and operatingSystem eq 'Windows' .

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### RemoveUsersWhenNoDeviceMatch

When enabled (default), users who no longer have a primary device matching the selected platform(s) are removed from the target group. Disable to add-only mode — existing members are never removed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### IncludeGroupId

Optional. Only users who are members of this group are eligible to be added to the target group. Leave empty to consider all primary users.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ExcludeGroupId

Optional. Users who are members of this group will not be added and will be removed from the target group if already present.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

