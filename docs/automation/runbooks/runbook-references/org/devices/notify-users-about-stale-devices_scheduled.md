---
title: Notify Users About Stale Devices (Scheduled)
description: Notify primary users about their stale devices via email
---

## Description
Identifies devices that haven't been active for a specified number of days and sends personalized email notifications to the primary users of those devices. The email contains device information and action steps for the user. Optionally filter users by including or excluding specific groups. Devices without a primary user (and devices whose primary user matches a configurable name pattern, e.g. Device Enrollment Manager accounts) can optionally be routed to the override email recipient while all other notifications are sent directly to the end users.

## Setup regarding email sending

Sending an email report is optional and only happens when a recipient (`EmailTo`) is provided. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details.

## Mail Template Language Selection

This runbook supports three email template options:

1. **EN (English - Default)**: Uses the built-in English template
2. **DE (German)**: Uses the built-in German template
3. **Custom**: Uses a custom template from Runbook Customizations

### Using Custom Mail Templates

To use a custom mail template (e.g., in Dutch, Spanish, or any other language), you need to configure the template text in the Runbook Customizations. If any custom template parameter is missing, the runbook will automatically fall back to the English template.

#### Example: Custom Template

```json
{
    "Runbooks": {
        "rjgit-org_devices_notify-users-about-stale-devices_scheduled": {
            "Parameters": {
                "CustomMailTemplateSubject": {
                    "Default": "This is a custom subject - Action Required: Inactive Devices"
                },
                "CustomMailTemplateBeforeDeviceDetails": {
                    "Default": "**This is above the Device Details.** \n\nDear user ..."
                },
                "CustomMailTemplateAfterDeviceDetails": {
                    "Default": "**This is below the Device Details.** \n\n## What you should do..."
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

## Routing Devices Without a Primary User to the Override Recipient

By default, stale devices without a primary user are skipped, and a filled `OverrideEmailRecipient` redirects **all** notifications. Enabling `SendNoPrimaryUserDevicesToOverride` changes this: devices without a primary user (and devices whose primary user matches `OverrideUserNamePattern`) are sent to the `OverrideEmailRecipient`, while all other notifications go directly to the end users.

| `SendNoPrimaryUserDevicesToOverride` | `OverrideEmailRecipient` | Behavior |
| --- | --- | --- |
| Off | empty | Devices without a primary user are skipped; users are mailed directly. |
| Off | set | All notifications are redirected to the override recipient. |
| On | set | Devices without a primary user are collected into **one** combined email to the override recipient. Users matching the pattern are redirected to the override recipient. All other users receive their notification directly. |
| On | empty | Invalid configuration - the runbook stops with an error. |

### User Name Pattern

`OverrideUserNamePattern` accepts one or more wildcard patterns (comma-separated) matched against the primary user's UPN, e.g. `DEM-*` for Device Enrollment Manager accounts or `DEM-*,KIOSK-*` for multiple patterns. Matching is case-insensitive and uses PowerShell wildcard syntax (`*`, `?`). The pattern is only evaluated when `SendNoPrimaryUserDevicesToOverride` is enabled.

**Important Notes:**

- Enabling `SendNoPrimaryUserDevicesToOverride` requires `OverrideEmailRecipient` to be set
- Devices without a primary user bypass the user scope filtering (they have no user to match against groups)
- Pattern-matched users are still subject to user scope filtering first; users excluded by scope produce no notification at all
- The combined email for devices without a primary user uses an administrative wording (no end-user action steps), independent of custom templates



## Location
Organization → Devices → Notify Users About Stale Devices (Scheduled)

**Full Runbook name**

rjgit-org_devices_notify-users-about-stale-devices_scheduled

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
  - Directory.Read.All
  - Device.Read.All
  - Group.Read.All
  - Mail.Send


## Parameters
### Days

Number of days without activity to be considered stale (minimum threshold).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |

### MaxDays

Optional maximum number of days without activity. If set, only devices inactive between Days and MaxDays will be included.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | Int32 |

### Windows

Include Windows devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### MacOS

Include macOS devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### iOS

Include iOS devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### Android

Include Android devices in the results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskDisplayName

Service Desk display name for user contact information (optional).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskEmail

Service Desk email address for user contact information (optional).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskPhone

Service Desk phone number for user contact information (optional).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskPortalUrl

Service Desk portal URL for user contact information, rendered as a clickable link (optional).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskTicketUrl

Direct link to a Service Desk ticket, rendered as a clickable link (optional). Empty by default, so no ticket link is added.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### UseUserScope

Enable user scope filtering to include or exclude users based on group membership.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeUserGroup

Only send emails to users who are members of this group. Requires UseUserScope to be enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ExcludeUserGroup

Do not send emails to users who are members of this group. Requires UseUserScope to be enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### OverrideEmailRecipient

Optional: Email address(es) to send all notifications to instead of end users. Can be comma-separated for multiple recipients. Perfect for testing, piloting, or sending to ticket systems. If left empty, emails will be sent to the actual end users.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SendNoPrimaryUserDevicesToOverride

If enabled, stale devices without a primary user (and devices whose primary user matches OverrideUserNamePattern) are sent to OverrideEmailRecipient, while all other notifications go directly to the end users. Requires OverrideEmailRecipient to be set. Devices without a primary user bypass user scope filtering.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### OverrideUserNamePattern

Optional wildcard pattern(s) matched against the primary user UPN (comma-separated, e.g. 'DEM-*,KIOSK-*', case-insensitive). Matching users' notifications are redirected to OverrideEmailRecipient. Only used when SendNoPrimaryUserDevicesToOverride is enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### MailTemplateLanguage

Select which email template to use: EN (English, default), DE (German), or Custom (from Runbook Customizations).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | EN |
| Type | String |

### CustomMailTemplateSubject

Custom email subject line (only used when MailTemplateLanguage is set to 'Custom').

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CustomMailTemplateBeforeDeviceDetails

Custom text to display before the device list (only used when MailTemplateLanguage is set to 'Custom'). Supports Markdown formatting.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CustomMailTemplateAfterDeviceDetails

Custom text to display after the device list (only used when MailTemplateLanguage is set to 'Custom'). Supports Markdown formatting.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

