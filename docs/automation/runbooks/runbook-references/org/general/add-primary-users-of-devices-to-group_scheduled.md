---
title: Add Primary Users Of Devices To Group (Scheduled)
description: Keep a group in sync with the primary users of Intune devices
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Collects the primary users of all Intune devices of the chosen platforms and keeps an Entra ID group in sync with them. Users without a matching device are removed unless removal is turned off. An include group limits which users are eligible, an exclude group blocks users. A report-only mode previews the changes by email without applying anything.

## Common use cases

- Keeping a distribution or Conditional Access target group aligned with "who currently has a managed device", filtered by platform, by an advanced OData filter or by an include/exclude group scope.
- Validating a new or changed filter or scope before it is allowed to write to a production group.

A daily schedule is recommended.

## Report-only mode for pilots and testing

Enable `ReportOnly` to compute the same add/remove diff a real run would produce, without applying any change to the group. Instead, a Markdown preview email listing the affected users by UPN is sent to `EmailTo`: each list (would be added, would be removed) shows at most 10 users in the mail body, with a "... and N more" pointer when a list is longer, and the complete lists are attached as report file(s) in the format chosen by `ReportFileFormat`. Run once in this mode after changing the platform selection, `AdvancedFilter` or the include/exclude groups, review the preview, then disable `ReportOnly` to let the sync apply.

## Parameter interactions

- `AdvancedFilter`, when set, replaces the Windows/macOS/iOS/Android platform selection entirely rather than combining with it.
- `RemoveUsersWhenNoDeviceMatch` controls both the real run and the `ReportOnly` preview: when disabled, no users are removed in either case, so the preview always reflects what a real run would do.

## Setup regarding email sending

Sending an email report is optional and only happens when the `ReportOnly` option is enabled; a recipient (`EmailTo`) is then required. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details on all available settings.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** – public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** – target of the footer image
- **Accent and text color** – 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email – the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).


## Location
Organization → General → Add Primary Users Of Devices To Group (Scheduled)

**Full Runbook name**

rjgit-org_general_add-primary-users-of-devices-to-group_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.2.0 |
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

Group that receives the primary users. Its membership is managed by this runbook alone.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Target group |

### Windows

Includes the primary users of Windows devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Windows devices? |

### MacOS

Includes the primary users of macOS devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include macOS devices? |

### iOS

Includes the primary users of iOS and iPadOS devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include iOS devices? |

### Android

Includes the primary users of Android devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include Android devices? |

### AdvancedFilter

OData filter for the devices instead of the platform switches, for example startsWith(deviceName,'FWP-') and operatingSystem eq 'Windows'.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Custom filter |

### RemoveUsersWhenNoDeviceMatch

Removes users from the target group when they are no longer primary user of a matching device. Turn off to only ever add.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Remove users without a matching device? |

### IncludeGroupId

Only members of this group can be added to the target group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Include users from group |
| Hidden in portal | yes (preset via runbook customization) |

### ExcludeGroupId

Members of this group are never added and are removed if present.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Exclude users from group |
| Hidden in portal | yes (preset via runbook customization) |

### ReportOnly

Previews the changes without applying them. The preview goes by email, with the first 10 users per list in the body and the complete lists attached.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Report only? |

### EmailFrom

Sender address of the report email. Taken from the tenant setting RJReport.EmailSender.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingHeaderImageUrl

Header image of the report email (HTTPS URL, PNG/JPEG/GIF, max 200 KB). Taken from the tenant setting RJReport.Branding.HeaderImageUrl; the default RealmJoin header is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterImageUrl

Footer image of the report email (HTTPS URL, PNG/JPEG/GIF, max 200 KB). Taken from the tenant setting RJReport.Branding.FooterImageUrl; the default RealmJoin footer is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterLink

Link behind the footer image of the report email. Taken from the tenant setting RJReport.Branding.FooterLink; realmjoin.com is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingAccentColor

Accent color of the report email as a 6-digit hex value. Taken from the tenant setting RJReport.Branding.AccentColor; the RealmJoin default is used when empty or invalid.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingTextColor

Text color of the report email as a 6-digit hex value. Taken from the tenant setting RJReport.Branding.TextColor; the RealmJoin default is used when empty or invalid.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### EmailTo

Address the preview goes to. Only used in report-only mode.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Send preview report to |

### ReportFileFormat

Attach the complete lists as CSV, as an Excel workbook, or both. Only used in report-only mode.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | CSV & XLSX |
| Type | String |
| Portal display name | Preview report file format |

**Portal options**

| Portal option | Value |
| --- | --- |
| CSV & XLSX | CSV & XLSX |
| CSV only | CSV only |
| XLSX only | XLSX only |



[Back to Runbook Reference overview](../../README.md)

