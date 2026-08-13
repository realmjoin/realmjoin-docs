---
title: Resize Windows365
description: Resize an existing Windows 365 Cloud PC for a user
---

## Description
Resizes a Windows 365 Cloud PC by removing the current assignment and provisioning a new size using a different license group.
WARNING: This operation deprovisions and reprovisions the Cloud PC and local data may be lost.

## Location
User → General → Resize Windows365

**Full Runbook name**

rjgit-user_general_resize-windows365

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - GroupMember.ReadWrite.All
  - Group.ReadWrite.All
  - Directory.Read.All
  - CloudPC.ReadWrite.All
  - User.Read.All
  - Mail.Send


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### currentLicWin365GroupName

Current Windows 365 license group name used by the Cloud PC.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |
| Portal display name | The to-be-resized Cloud PC uses the following Windows365 license:  |

**Portal options**

| Portal option | Value |
| --- | --- |
| lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB | lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB |

### newLicWin365GroupName

New Windows 365 license group name to assign for the resized Cloud PC.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB |
| Type | String |
| Portal display name | Resizing to following license:  |

**Portal options**

| Portal option | Value |
| --- | --- |
| lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB | lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB |

### sendMailWhenDoneResizing

"Do not send an Email." (final value: $false) or "Send an Email." (final value: $true) can be selected as action to perform. If set to true, an email notification will be sent to the user when Cloud PC resizing has finished.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Notify User once the Cloud PC has finished resizing? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Do not send an Email. |  |
| Send an Email. |  |

### fromMailAddress

Mailbox used to send the notification email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | reports@contoso.com |
| Type | String |
| Portal display name | (Shared) Mailbox to send mail from:  |

### customizeMail

If set to true, uses a custom email body.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Would you like to customize the mail sent to the user? |

### customMailMessage

Custom message body used for the notification email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Insert Custom Message here. (Capped at 3000 characters) |
| Type | String |
| Portal display name | Custom message to be sent to the user. |

### cfgProvisioningGroupPrefix

Prefix used to detect provisioning-related configuration groups.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - Provisioning - |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### cfgUserSettingsGroupPrefix

Prefix used to detect user-settings-related configuration groups.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - User Settings - |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### unassignRunbook

Name of the runbook used to remove the current Windows 365 assignment.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjgit-user_general_unassign-windows365 |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### assignRunbook

Name of the runbook used to assign the new Windows 365 configuration.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjgit-user_general_assign-windows365 |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### skipGracePeriod

If set to true, ends the old Cloud PC grace period immediately.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Remove the old Cloud PC immediately? |



[Back to Runbook Reference overview](../../README.md)

