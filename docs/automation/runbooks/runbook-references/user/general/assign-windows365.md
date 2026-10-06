---
title: Assign Windows365
description: Provision a Windows 365 Cloud PC for this user
---

## Description
Assigns this user the groups that trigger Windows 365 provisioning: the provisioning policy or Frontline assignment, the user settings policy and, for a dedicated Cloud PC, the license group. Optionally the user gets an email once the Cloud PC is ready, and a service ticket is opened by email when no licenses or Frontline seats are left.

## Offer the policy and license groups as dropdowns

The provisioning policy, user settings policy and license group are plain text fields by default. Turn them into dropdowns with the group names of your tenant via runbook customization:

```json
"rjgit-user_general_assign-windows365": {
    "Parameters": {
        "cfgProvisioningGroupName": {
            "SelectSimple": {
                "cfg - Windows 365 - Provisioning - Win11": "cfg - Windows 365 - Provisioning - Win11",
                "cfg - Windows 365 - Provisioning - Win10": "cfg - Windows 365 - Provisioning - Win10"
            }
        },
        "cfgUserSettingsGroupName": {
            "SelectSimple": {
                "cfg - Windows 365 - User Settings - restore allowed": "cfg - Windows 365 - User Settings - restore allowed",
                "cfg - Windows 365 - User Settings - no restore": "cfg - Windows 365 - User Settings - no restore"
            }
        },
        "licWin365GroupName": {
            "SelectSimple": {
                "lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB": "lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB",
                "lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB": "lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB"
            }
        }
    }
}
```

The group name prefixes (`cfgProvisioningGroupPrefix`, `cfgUserSettingsGroupPrefix`) decide which groups count as provisioning or user settings groups; adjust them in the same place when your naming differs.

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).


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

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### cfgProvisioningGroupName

Provisioning policy group for a dedicated Cloud PC, or the name of the Frontline provisioning policy. Type the name, or pick it when your runbook customization offers a list.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - Provisioning - Win11 |
| Type | String |
| Portal display name | Provisioning policy or Frontline assignment |

### cfgUserSettingsGroupName

Group that carries the user settings policy, for example whether the user may restore the Cloud PC.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - User Settings - restore allowed |
| Type | String |
| Portal display name | User settings policy |

### licWin365GroupName

License group for a dedicated Cloud PC. Not needed for Frontline.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |
| Portal display name | Windows 365 license (dedicated Cloud PC) |

### cfgProvisioningGroupPrefix

Name prefix that identifies provisioning policy groups. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - Provisioning - |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### cfgUserSettingsGroupPrefix

Name prefix that identifies user settings policy groups. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - User Settings - |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### sendMailWhenProvisioned

Sends the user an email as soon as provisioning has finished.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Notify the user when the Cloud PC is ready? |

### customizeMail

Replaces the standard notification text with your own message. Only used when the user is notified.

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

### createTicketOutOfLicenses

Sends a ticket email to the service desk when no license or Frontline seat is available.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Open a service ticket when licenses run out? |

### ticketQueueAddress

Mailbox of the service desk that turns the email into a ticket.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja-gab.com |
| Type | String |
| Portal display name | Service ticket address |

### fromMailAddress

Mailbox the notification and ticket emails are sent from.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbooks@contoso.com |
| Type | String |
| Portal display name | Sender mailbox |

### ticketCustomerId

Customer identifier put into the ticket subject.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Contoso |
| Type | String |
| Portal display name | Customer ID for tickets |



[Back to Runbook Reference overview](../../README.md)

