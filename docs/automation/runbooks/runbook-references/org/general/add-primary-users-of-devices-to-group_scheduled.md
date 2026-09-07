---
title: Add Primary Users Of Devices To Group (Scheduled)
description: Sync primary users of Intune managed devices by platform into an Entra ID group
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
This runbook collects the primary users of all Intune managed devices matching the selected platform(s) and synchronizes them into a target Entra ID group. Users no longer assigned as primary user on any matching device are removed from the group. An optional include group restricts which users are eligible, and an optional exclude group prevents specific users from being added or keeps them removed. A report-only mode allows previewing the proposed changes via email (email body shows at most 10 users per list, complete lists attached as CSV and/or XLSX file) without making any modifications.

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

## Notes
Runbook Type: Scheduled (recommended: daily)

Common Use Cases:
- Keeping a distribution or Conditional Access target group aligned with "who currently has a
  managed device", filtered by platform, an advanced OData filter, or an include/exclude group scope.
- Validating a new or changed filter/scope before it is allowed to write to a production group.

Pilot and Testing Options:
- Enable ReportOnly to compute the same add/remove diff a real run would produce, without applying
  any change to the group. A Markdown preview email listing the affected users (by UPN) is sent to
  EmailTo instead; each list (would be added / would be removed) shows at most 10 users in the mail
  body, with a "... and N more" pointer when a list is longer, and the complete lists are attached
  as report file(s) in the format chosen by ReportFileFormat. Run once in this mode after changing
  the platform selection, AdvancedFilter, or the include/exclude groups, review the preview, then
  disable ReportOnly to let the sync apply.

Parameter Interactions:
- AdvancedFilter, when set, replaces the Windows/MacOS/iOS/Android platform selection entirely
  rather than combining with it.
- RemoveUsersWhenNoDeviceMatch controls both the real run and the ReportOnly preview: when disabled,
  no users are removed in either case, so the preview always reflects what a real run would do.

Prerequisites:
- EmailFrom requires the RJReport.EmailSender tenant setting to be configured; this is only needed
  when ReportOnly is used to send the preview email.

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

### ReportOnly

If set to true, the script computes what would change but applies no modifications. The proposed changes are sent to the EmailTo recipient in a preview email showing at most 10 users per list in the body, with complete lists attached as CSV and/or XLSX file(s) per ReportFileFormat. If false, the runbook applies all changes immediately.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Report only (preview changes, apply nothing) |

### EmailFrom

The sender email address for report-only preview emails. This needs to be configured in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingHeaderImageUrl

URL of a custom header image for report emails. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterImageUrl

URL of a custom footer image for report emails. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterLink

Link target applied to the footer image in report emails, for example the company website. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingAccentColor

Accent color used for headings and highlights in report emails. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingTextColor

Body text color used in report emails. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### EmailTo

Recipient email address for the report-only preview email. The email shows at most 10 users per list in the body, with complete lists attached as CSV and/or XLSX file(s) per ReportFileFormat. Only used when ReportOnly is set to true.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Send preview report to (only used when Report only is enabled) |

### ReportFileFormat

File format of the report attached to the report-only preview email. The attachments contain the complete lists of users that would be added or removed, while the email body shows at most 10 users per list. Only used when ReportOnly is enabled and EmailTo is set.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | CSV & XLSX |
| Type | String |
| Portal display name | Preview report file format (only used when Report only is enabled) |

**Portal options**

| Portal option | Value |
| --- | --- |
| CSV & XLSX |  |
| CSV only |  |
| XLSX only |  |



[Back to Runbook Reference overview](../../README.md)

