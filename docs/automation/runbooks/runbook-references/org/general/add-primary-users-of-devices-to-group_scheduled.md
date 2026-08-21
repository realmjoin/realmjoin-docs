---
title: Add Primary Users Of Devices To Group (Scheduled)
description: Sync primary users of Intune managed devices by platform into an Entra ID group
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
This runbook collects the primary users of all Intune managed devices matching the selected platform(s) and synchronizes them into a target Entra ID group. Users no longer assigned as primary user on any matching device are removed from the group. An optional include group restricts which users are eligible, and an optional exclude group prevents specific users from being added or keeps them removed.

## Location
Organization → General → Add Primary Users Of Devices To Group (Scheduled)

**Full Runbook name**

rjgit-org_general_add-primary-users-of-devices-to-group_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
    - *Reads Intune managed devices filtered by OS to collect each device's primary user*
  - Group.Read.All
    - *Validates the target/include/exclude groups and reads their member lists*
  - GroupMember.ReadWrite.All
    - *Adds and removes users in the target group via batched /groups/{id}/members/$ref calls*
  - User.Read.All
    - *Reads member id and UPN to identify user members and log removals*


## Parameters
### TargetGroupId

The Entra ID group to synchronize primary users into. Members of this group will be managed exclusively by this runbook.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Target Group (sync primary users into) |

### Windows

Include primary users of Windows devices. (OData Filter used "operatingSystem eq 'Windows'")

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Windows Devices |

### MacOS

Include primary users of macOS devices. (OData Filter used "operatingSystem eq 'macOS'")

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include macOS Devices |

### iOS

Include primary users of iOS and iPadOS devices. (OData Filter used "operatingSystem eq 'iOS'")

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include iOS Devices |

### Android

Include primary users of Android devices. (OData Filter used "operatingSystem eq 'Android'")

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Android Devices |

### AdvancedFilter

Optional. Custom OData filter to apply when retrieving devices. Overrides the platform-based filters if provided. Example: startsWith(deviceName,'FWP-') and operatingSystem eq 'Windows' .

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Custom filter (overrides OS selection) |

### RemoveUsersWhenNoDeviceMatch

When enabled (default), users who no longer have a primary device matching the selected platform(s) are removed from the target group. Disable to add-only mode — existing members are never removed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Remove users who no longer have a matching device |

### IncludeGroupId

Optional. Only users who are members of this group are eligible to be added to the target group. Leave empty to consider all primary users.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Include users from group (optional) |
| Hidden in portal | yes (preset via runbook customization) |

### ExcludeGroupId

Optional. Users who are members of this group will not be added and will be removed from the target group if already present.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Exclude users from group (optional) |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

