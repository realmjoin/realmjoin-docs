---
title: Notify Users About Stale Devices (Scheduled)
description: Notify primary users about their stale devices via email
---

## Description
Identifies devices that haven't been active for a specified number of days and sends personalized email notifications to the primary users of those devices. The email contains device information and action steps for the user. Optionally filter users by including or excluding specific groups.

## Setup regarding email sending

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

This process is described in detail in the [Setup Email Reporting](https://github.com/realmjoin/realmjoin-runbooks/tree/master/docs/general/setup-email-reporting.md) documentation.



## Location
Organization → Devices → Notify Users About Stale Devices_Scheduled

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



[Back to Runbook Reference overview](../../README.md)

