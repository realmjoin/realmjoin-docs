---
title: Reprovision Windows365
description: Reprovision a Windows 365 Cloud PC
---

## Description
Triggers a reprovision action for an existing Windows 365 Cloud PC without assigning a new instance. Optionally notifies the user when reprovisioning starts.

## Location
User → General → Reprovision Windows365

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

### licWin365GroupName

Display name of the Windows 365 license group used to identify the Cloud PC.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |

### sendMailWhenReprovisioning

"Do not send an Email." (final value: $false) or "Send an Email." (final value: $true) can be selected as action to perform. If set to true, an email notification will be sent to the user when Cloud PC reprovisioning has begun.

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



[Back to Runbook Reference overview](../../README.md)

