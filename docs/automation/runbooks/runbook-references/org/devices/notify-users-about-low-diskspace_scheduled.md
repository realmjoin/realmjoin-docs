---
title: Notify Users About Low Diskspace (Scheduled)
description: Notify primary users about low disk space on their devices via email
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Identifies Intune managed Windows and macOS devices whose free disk space is below a configurable threshold, either a fixed amount of free space in gigabytes or a percentage of the total disk size, and sends one personalized email per primary user.
The email lists all affected devices of the user with their free and total disk space, rates each device as Critical or Warning and contains practical, platform-specific steps to free up space.
The evaluation can be limited to critical devices, to devices with a recent Intune inventory, to the members of an Entra device group and to users included in or excluded by a group.
A simulation mode lists the affected users and devices without sending anything, and a global override recipient redirects all notifications to a test or shared mailbox.

## Data freshness and limitations

The free and total disk space values are read from the Intune hardware inventory of each managed device. This inventory is refreshed with the regular device check-in, so the runbook sees the state of the last successful inventory rather than the current state of the device. To avoid notifying users based on outdated numbers, devices whose last Intune sync is older than `MaxInventoryAgeDays` (default 14 days) are skipped and counted separately. Devices without a last sync date are treated as outdated as well. Set the parameter to `0` to disable this check.

Devices that report a total disk size of zero bytes have no usable storage inventory, for example devices that have not completed an inventory yet. Such devices are excluded from the evaluation instead of being treated as "0 GB free", and their number is shown in the console output.

Only Windows and macOS devices are evaluated. The storage inventory of mobile devices is less reliable, the default threshold in gigabytes is dimensioned for desktop disks, and the cleanup guidance in the email is specific to desktop operating systems.

This runbook is the user-facing counterpart of **Report Devices Low Diskspace**. Both use the same threshold settings and the same Critical/Warning rating. Use the report for the administrative overview, including devices without a primary user, and this runbook to ask the affected users to free up space themselves.

## Threshold and severity

`ThresholdType` selects whether a device is considered based on a fixed amount of free space (`FreeSpaceThresholdGB`) or based on the share of free space relative to its disk size (`FreeSpacePercentThreshold`). Only the field belonging to the selected type is shown in the portal.

Every device below the threshold is rated: devices below half of the configured threshold are marked as **Critical**, all other devices below the threshold as **Warning**. The rating is shown per device in the email, and the subject line and introduction switch to an urgent wording as soon as one of the user's devices is Critical.

`NotifyOnSeverity` controls which devices trigger a notification. By default every device below the threshold does (*Warning and Critical*). With *Critical only*, users are contacted only when a device is below half of the threshold. This allows a two-stage approach: report all devices below the threshold to administrators via the report runbook, and notify only the users whose devices are critical.

## Notification behaviour

The runbook sends **one email per primary user** that lists all affected devices of that user with operating system, model, free and total disk space, rating and the date of the last inventory. The email contains practical cleanup steps for the platforms of the listed devices: the Windows section is included for Windows devices, the macOS section for macOS devices, and both when the user has affected devices of both kinds.

Recipients are resolved via Microsoft Graph: the email is sent to the user's `mail` attribute, with the user principal name as fallback when no mail attribute is set. Disabled accounts and users that cannot be resolved are skipped and listed in the console output. Devices without a primary user cannot be notified; they are listed in the console output for central follow-up (the report runbook covers them as well).

`SimulationMode` lists the affected users, their devices and the intended recipients in the console output without sending any email. Use it to validate thresholds and scope filters before the first productive run.

`OverrideEmailRecipient` redirects **ALL** notifications to the given address (comma-separated for multiple recipients) instead of the end users. A warning is logged on every run while the override is active, and each redirected email states the affected user in the subject and body. Use this for testing the email content or for routing everything to a shared mailbox.

## Scoping options

- **User scope:** With `UseUserScope` enabled, `IncludeUserGroup` limits the notifications to users who are members of that group, and `ExcludeUserGroup` suppresses notifications for members of that group. Both use the transitive membership, so nested groups are resolved, and both are read once at the start of the run.
- **Device scope:** `IncludeDeviceGroup` limits the evaluation to devices that are (transitive) members of the given Entra device group. Devices are matched via their Entra device ID.

When a user scope and a device scope are configured, a device has to match both. A failing group lookup stops the runbook with an error instead of silently notifying every user.

## Setup regarding email sending

The notification emails are sent to the affected users; the sender address is taken from the `RJReport.EmailSender` tenant setting and is required.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details on all available settings.

### Email branding

The notification email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** – public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** – target of the footer image
- **Accent and text color** – 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the email – the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).

### Service Desk contact information

The optional `RJReport.ServiceDesk_DisplayName`, `RJReport.ServiceDesk_EMail`, `RJReport.ServiceDesk_Phone` and `RJReport.ServiceDesk_PortalUrl` tenant settings add a contact block to the end of every email. `ServiceDeskTicketUrl` can additionally link to a ticket.

## Mail Template Language Selection

This runbook supports three email template options:

1. **EN (English - Default)**: Uses the built-in English template
2. **DE (German)**: Uses the built-in German template
3. **Custom**: Uses a custom template from Runbook Customizations

### Using Custom Mail Templates

To use a custom mail template (e.g., in Dutch, Spanish, or any other language), you need to configure the template text in the Runbook Customizations. If any custom template parameter is missing, the runbook will automatically fall back to the English template.

The custom template consists of a subject, a text before the device list and a text after the device list. The built-in cleanup steps, the "Why is this important" section and the "Questions" section are **not** rendered with the custom template, so the text after the device list should contain your own cleanup guidance.

#### Example: Custom Template

```json
{
    "Runbooks": {
        "rjgit-org_devices_notify-users-about-low-diskspace_scheduled": {
            "Parameters": {
                "CustomMailTemplateSubject": {
                    "Default": "This is a custom subject - Action Required: Low Disk Space"
                },
                "CustomMailTemplateBeforeDeviceDetails": {
                    "Default": "**This is above the Device Details.** \n\nDear user, the following devices are running out of disk space:"
                },
                "CustomMailTemplateAfterDeviceDetails": {
                    "Default": "**This is below the Device Details.** \n\n## What you can do now\n\n1. Empty the Recycle Bin\n2. ..."
                }
            }
        }
    }
}
```

**Important Notes:**
- Use `\n` for line breaks in the JSON configuration
- Markdown formatting (##, ###, **, -) is supported in the template text
- All three custom template parameters (Subject, BeforeDeviceDetails, AfterDeviceDetails) should be configured
- If any parameter is missing, the runbook automatically falls back to the English (EN) template
- When using the custom template, select "Custom - Use Template from Runbook Customizations" in the Mail Template dropdown
- The device list labels are rendered in English for the custom template


## Location
Organization → Devices → Notify Users About Low Diskspace (Scheduled)

**Full Runbook name**

rjgit-org_devices_notify-users-about-low-diskspace_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | yes |

## Notes
This runbook is the user-facing counterpart of the "Report Devices Low Diskspace" runbook. Both use the same threshold settings and the same
Critical/Warning rating, so the report gives administrators the overview while this runbook asks the affected users to free up space themselves.

Prerequisites:
- EmailFrom parameter must be configured in runbook customization (RJReport.EmailSender setting)
- Optional: Service Desk contact information can be configured (ServiceDesk_DisplayName, ServiceDesk_EMail, ServiceDesk_Phone, ServiceDesk_PortalUrl)

Data source and freshness:
The free and total disk space values are taken from the Intune hardware inventory of each device, which is refreshed with the regular device check-in.
They describe the state of the last successful inventory and not necessarily the current state of the device. To avoid notifying users based on outdated
numbers, devices whose last Intune sync is older than MaxInventoryAgeDays are skipped (0 disables this check).
Devices that report a total disk size of zero bytes have no usable storage inventory and are excluded from the evaluation, but their number is reported.
Only Windows and macOS devices are evaluated, because the storage inventory of mobile devices is less reliable and the cleanup guidance differs.

Common Use Cases:
- Recurring reminders to users whose devices are about to run out of disk space, before updates and app installations start to fail
- Two-stage campaigns: report all devices below the threshold to administrators, notify only the critical ones (NotifyOnSeverity)
- Staged rollouts per department or pilot group via the user and device group scope options
- Excluding service or shared accounts via the exclude group

Pilot and Testing Options:
- Use SimulationMode to list the affected users and devices without sending any email
- Use OverrideEmailRecipient to send all notifications to a test mailbox instead of end users
- Perfect for validating email content and testing thresholds and filters before rolling out to production

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
    - *Reads Intune managed devices including freeStorageSpaceInBytes, totalStorageSpaceInBytes, lastSyncDateTime and the primary user to find devices below the low disk space threshold*
  - User.Read.All
    - *Resolves each affected primary user (mail address, display name and accountEnabled) before sending the notification*
  - Mail.Send
    - *Sends the low disk space notification email to each primary user or to the override recipient*
  - Organization.Read.All *(optional — feature: Tenant name in email footer)*
    - *Reads /organization for the tenant name shown in the email footer; without it the runbook falls back to 'Unknown Tenant'*
  - Directory.Read.All *(optional — feature: Group scope filtering)*
    - *Reads the transitive user members of the include/exclude user groups and the transitive device members (Entra device ID) of the optional device group*


## Parameters
### ThresholdType

Determines how low disk space is detected, either by a fixed amount of free space in gigabytes or by the percentage of free space relative to the disk size.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Free space in GB |
| Type | String |
| Portal display name | How should low disk space be determined? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Free space below a fixed size (GB) |  |
| Free space below a percentage of the disk size (%) |  |

### FreeSpaceThresholdGB

Devices with less free disk space than this value in gigabytes are considered. Only used when the threshold type is set to free space in gigabytes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 20 |
| Type | Int32 |
| Portal display name | Low Disk Space Threshold (free GB) |

### FreeSpacePercentThreshold

Devices with a lower percentage of free disk space than this value are considered. Only used when the threshold type is set to free space in percent.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 10 |
| Type | Int32 |
| Portal display name | Low Disk Space Threshold (free %) |
| Hidden in portal | yes (preset via runbook customization) |

### NotifyOnSeverity

Selects which devices trigger a notification: every device below the threshold (Warning and Critical) or only devices below half of the threshold (Critical only).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Warning and Critical |
| Type | String |
| Portal display name | Which devices should trigger a notification? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Warning and Critical - every device below the threshold |  |
| Critical only - devices below half of the threshold |  |

### Windows

Include Windows devices in the evaluation.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include Windows Devices |

### MacOS

Include macOS devices in the evaluation.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include macOS Devices |

### MaxInventoryAgeDays

Devices whose last Intune sync is older than this number of days are skipped, because their storage inventory is considered outdated. Devices without a last sync date are skipped as well. Set to 0 to disable the check.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 14 |
| Type | Int32 |
| Portal display name | Skip devices whose last Intune sync is older than (days, 0 = no limit) |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingHeaderImageUrl

Optional public HTTPS URL of a custom header image (PNG/JPEG/GIF, max. 200 KB) for the notification email.
Sourced from the RJReport.Branding.HeaderImageUrl tenant setting. When empty, the default RealmJoin header graphic is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterImageUrl

Optional public HTTPS URL of a custom footer image (PNG/JPEG/GIF, max. 200 KB) for the notification email.
Sourced from the RJReport.Branding.FooterImageUrl tenant setting. When empty, the default RealmJoin footer graphic is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterLink

Optional URL the footer image links to. Sourced from the RJReport.Branding.FooterLink tenant setting.
When empty, the default link (https://www.realmjoin.com) is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingAccentColor

Optional accent color override (6-digit hex, e.g. '#0052cc') for the notification email template.
Sourced from the RJReport.Branding.AccentColor tenant setting. When empty or invalid, the default RealmJoin accent color is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingTextColor

Optional text color override (6-digit hex) for the notification email template.
Sourced from the RJReport.Branding.TextColor tenant setting. When empty or invalid, the default RealmJoin text color is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ServiceDeskDisplayName

Service Desk display name for user contact information (optional).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ServiceDeskEmail

Service Desk email address for user contact information (optional).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ServiceDeskPhone

Service Desk phone number for user contact information (optional).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ServiceDeskPortalUrl

Service Desk portal URL for user contact information, rendered as a clickable link (optional).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ServiceDeskTicketUrl

Direct link to a Service Desk ticket, rendered as a clickable link (optional). Empty by default, so no ticket link is added.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### UseUserScope

Enable user scope filtering to include or exclude users based on group membership.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Use User Scope Filtering |
| Hidden in portal | yes (preset via runbook customization) |

### IncludeUserGroup

Only notify users who are (transitive) members of this group. Requires UseUserScope to be enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Users to include (Group) |
| Hidden in portal | yes (preset via runbook customization) |

### ExcludeUserGroup

Do not notify users who are (transitive) members of this group. Requires UseUserScope to be enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Users to exclude (Group) |
| Hidden in portal | yes (preset via runbook customization) |

### IncludeDeviceGroup

Optional Entra device group. When set, only devices that are (transitive) members of this group are evaluated. Can be combined with the user scope.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Limit to devices in group (optional) |

### OverrideEmailRecipient

Optional: Global override - when set, ALL notifications are sent to this address instead of the end users. Can be comma-separated for multiple recipients. Perfect for testing and piloting, or for routing everything to a shared mailbox. If left empty, every user is mailed directly.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Redirect * ALL * Emails to Override Recipient(s) |

### SimulationMode

When enabled, the runbook lists the affected users and devices in the output but does not send any email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Notification mode |

**Portal options**

| Portal option | Value |
| --- | --- |
| Send notifications to users | false |
| Simulation - list affected users only, send nothing | true |

### MailTemplateLanguage

Select which email template to use: EN (English, default), DE (German), or Custom (from Runbook Customizations).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | EN |
| Type | String |
| Portal display name | Mail Template |
| Hidden in portal | yes (preset via runbook customization) |

### CustomMailTemplateSubject

Custom email subject line (only used when MailTemplateLanguage is set to 'Custom').

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Custom: Email Subject |
| Hidden in portal | yes (preset via runbook customization) |

### CustomMailTemplateBeforeDeviceDetails

Custom text to display before the device list (only used when MailTemplateLanguage is set to 'Custom'). Supports Markdown formatting.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Custom: Text Before Device List |
| Hidden in portal | yes (preset via runbook customization) |

### CustomMailTemplateAfterDeviceDetails

Custom text to display after the device list (only used when MailTemplateLanguage is set to 'Custom'). Supports Markdown formatting. Replaces the built-in cleanup steps, so it should contain its own guidance.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Custom: Text After Device List |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

