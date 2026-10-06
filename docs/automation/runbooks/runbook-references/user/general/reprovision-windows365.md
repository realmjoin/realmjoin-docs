---
title: Reprovision Windows365
description: Reprovision the Windows 365 Cloud PC of this user
---

## Description
Reprovisions the existing Windows 365 Cloud PC of this user. The Cloud PC is rebuilt from scratch with the same license, so everything stored on it is lost; the user keeps the assignment. Optionally the user gets an email when the reprovisioning starts.

## Offer the license groups as a dropdown

The license group is a text field by default. Offer the license groups of your tenant as a dropdown via runbook customization:

```json
"rjgit-user_general_reprovision-windows365": {
    "Parameters": {
        "licWin365GroupName": {
            "SelectSimple": {
                "lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB": "lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB",
                "lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB": "lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB"
            }
        }
    }
}
```

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).


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

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### licWin365GroupName

License group of the Cloud PC to reprovision. Type the group name, or pick it when your runbook customization offers a list.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |
| Portal display name | Windows 365 license of the Cloud PC |

### sendMailWhenReprovisioning

Sends the user an email as soon as the reprovisioning has begun.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Notify the user when reprovisioning starts? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Do not send an email | false |
| Send an email | true |

### fromMailAddress

Mailbox the notification email is sent from.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | reports@contoso.com |
| Type | String |
| Portal display name | Sender mailbox |

### customizeMail

Replaces the standard notification text with your own message.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Customize the notification email? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Use the standard email | false |
| Use a custom message | true |

### customMailMessage

Text of the notification email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Insert Custom Message here. (Capped at 3000 characters) |
| Type | String |
| Portal display name | Custom message |



[Back to Runbook Reference overview](../../README.md)

