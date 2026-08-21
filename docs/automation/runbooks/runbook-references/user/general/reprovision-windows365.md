---
title: Reprovision Windows365
description: Reprovision a Windows 365 Cloud PC
---

## Description
Triggers a reprovision action for an existing Windows 365 Cloud PC without assigning a new instance. Optionally notifies the user when reprovisioning starts.

## Location
User → General → Reprovision Windows365

**Full Runbook name**

rjgit-user_general_reprovision-windows365

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - GroupMember.ReadWrite.All
    - *Reads the license group members to confirm the user holds the Windows 365 license*
  - Group.ReadWrite.All
    - *Finds the license group by display name and reads its assigned licenses*
  - Directory.Read.All
    - *Reads /subscribedSkus to map the group's SKU to service plans and match the Cloud PC*
  - CloudPC.ReadWrite.All
    - *Lists the user's Cloud PCs and triggers the reprovision action*
  - User.Read.All
    - *Resolves the user by UPN and checks mailbox presence before mailing*
  - Mail.Send *(optional — feature: Email report)*
    - *Notifies the user via /users/{from}/sendMail when sendMailWhenReprovisioning is enabled*


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### licWin365GroupName

Display name of the Windows 365 license group used to identify the Cloud PC.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |
| Portal display name | Select the Windows 365 license to be used for reprovisioning |

**Portal options**

| Portal option | Value |
| --- | --- |
| lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB | lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB |

### sendMailWhenReprovisioning

"Do not send an Email." (final value: $false) or "Send an Email." (final value: $true) can be selected as action to perform. If set to true, an email notification will be sent to the user when Cloud PC reprovisioning has begun.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Notify user when CloudPC reprovisioning has begun? |

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



[Back to Runbook Reference overview](../../README.md)

