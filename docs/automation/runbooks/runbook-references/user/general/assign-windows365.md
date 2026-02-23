---
title: Assign Windows365
description: Assign and provision a Windows 365 Cloud PC for a user
---

## Description
Assigns the required groups and license or Frontline provisioning policy to initiate Windows 365 provisioning. Optionally notifies the user when provisioning completes and can create a support ticket when licenses are exhausted.

## Location
User → General → Assign Windows365

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - GroupMember.ReadWrite.All
  - Group.ReadWrite.All
  - User.SendMail


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### cfgProvisioningGroupName

Display name of the provisioning policy group or Frontline assignment to use.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - Provisioning - Win11 |
| Type | String |

### cfgUserSettingsGroupName

Display name of the user settings policy group to use.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - User Settings - restore allowed |
| Type | String |

### licWin365GroupName

Display name of the Windows 365 license group to assign when using dedicated Cloud PCs.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |

### cfgProvisioningGroupPrefix

Prefix used to detect provisioning-related configuration groups.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - Provisioning - |
| Type | String |

### cfgUserSettingsGroupPrefix

Prefix used to detect user-settings-related configuration groups.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - User Settings - |
| Type | String |

### sendMailWhenProvisioned

If set to true, sends an email to the user after provisioning completes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### customizeMail

If set to true, uses a custom email body.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### customMailMessage

Custom message body used for the notification email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Insert Custom Message here. (Capped at 3000 characters) |
| Type | String |

### createTicketOutOfLicenses

If set to true, creates a service ticket email when no licenses or Frontline seats are available.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ticketQueueAddress

Email address used as ticket queue recipient.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja-gab.com |
| Type | String |

### fromMailAddress

Mailbox used to send the ticket and user notification emails.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbooks@contoso.com |
| Type | String |

### ticketCustomerId

Customer identifier used in ticket subject lines.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Contoso |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

