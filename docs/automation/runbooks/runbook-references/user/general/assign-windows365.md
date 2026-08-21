---
title: Assign Windows365
description: Assign and provision a Windows 365 Cloud PC for a user
---

## Description
Assigns the required groups and license or Frontline provisioning policy to initiate Windows 365 provisioning. Optionally notifies the user when provisioning completes and can create a support ticket when licenses are exhausted.

## Location
User → General → Assign Windows365

**Full Runbook name**

rjgit-user_general_assign-windows365

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
    - *Resolves the target user by UPN and checks mailbox existence before mailing*
  - GroupMember.ReadWrite.All
    - *Adds the user to the provisioning, user-settings and license groups*
  - Group.ReadWrite.All
    - *Looks up config and license groups and reads their assigned licenses*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the out-of-licenses ticket and the user notification when the mail options are enabled*
  - CloudPC.Read.All
    - *Reads the provisioning policies, shared-use service plans and the user's Cloud PCs*
  - Organization.Read.All
    - *Reads /subscribedSkus to verify a free Windows 365 license in the dedicated plan path*


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### cfgProvisioningGroupName

Display name of the provisioning policy group or Frontline assignment to use.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - Provisioning - Win11 |
| Type | String |
| Portal display name | Provisioning Policy / FrontLine Assignment to use |

### cfgUserSettingsGroupName

Display name of the user settings policy group to use.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - User Settings - restore allowed |
| Type | String |
| Portal display name | User Settings Policy to use |

### licWin365GroupName

Display name of the Windows 365 license group to assign when using dedicated Cloud PCs.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |
| Portal display name | Windows 365 license to assign (if not FrontLine) |

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

### sendMailWhenProvisioned

If set to true, sends an email to the user after provisioning completes.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Notify user once the CloudPC is done provisioning? |

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

### createTicketOutOfLicenses

If set to true, creates a service ticket email when no licenses or Frontline seats are available.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Create a service ticket (email) if not enough licenses/FrontLine seats are available? |

### ticketQueueAddress

Email address used as ticket queue recipient.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja-gab.com |
| Type | String |
| Portal display name | Where to open a service ticket (via email) |

### fromMailAddress

Mailbox used to send the ticket and user notification emails.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbooks@contoso.com |
| Type | String |
| Portal display name | (Shared) Mailbox to send mail from |

### ticketCustomerId

Customer identifier used in ticket subject lines.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Contoso |
| Type | String |
| Portal display name | Customer ID string for service tickets |



[Back to Runbook Reference overview](../../README.md)

