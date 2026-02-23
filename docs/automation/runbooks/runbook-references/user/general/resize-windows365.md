---
title: Resize Windows365
description: Resize an existing Windows 365 Cloud PC for a user
---

## Description
Resizes a Windows 365 Cloud PC by removing the current assignment and provisioning a new size using a different license group.
WARNING: This operation deprovisions and reprovisions the Cloud PC and local data may be lost.

## Location
User → General → Resize Windows365

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - GroupMember.ReadWrite.All
  - Group.ReadWrite.All
  - Directory.Read.All
  - CloudPC.ReadWrite.All
  - User.Read.All
  - User.SendMail


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### currentLicWin365GroupName

Current Windows 365 license group name used by the Cloud PC.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |

### newLicWin365GroupName

New Windows 365 license group name to assign for the resized Cloud PC.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB |
| Type | String |

### sendMailWhenDoneResizing

"Do not send an Email." (final value: $false) or "Send an Email." (final value: $true) can be selected as action to perform. If set to true, an email notification will be sent to the user when Cloud PC resizing has finished.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### fromMailAddress

Mailbox used to send the notification email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | reports@contoso.com |
| Type | String |

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

### unassignRunbook

Name of the runbook used to remove the current Windows 365 assignment.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjgit-user_general_unassign-windows365 |
| Type | String |

### assignRunbook

Name of the runbook used to assign the new Windows 365 configuration.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjgit-user_general_assign-windows365 |
| Type | String |

### skipGracePeriod

If set to true, ends the old Cloud PC grace period immediately.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

