---
title: Resize Windows365
description: Resize the Windows 365 Cloud PC of this user
---

## Description
Moves the Windows 365 Cloud PC of this user to a different size by removing the current license assignment and provisioning a new Cloud PC with the new license. The old Cloud PC is deprovisioned, so data stored only on it is lost; ask the user to back up first. Optionally the user gets an email when the new Cloud PC is ready.

## Offer the license groups as dropdowns

Both license fields are text fields by default. Offer the license groups of your tenant as dropdowns via runbook customization (the same list for the current and the new license):

```json
"rjgit-user_general_resize-windows365": {
    "Parameters": {
        "currentLicWin365GroupName": {
            "SelectSimple": {
                "lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB": "lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB",
                "lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB": "lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB"
            }
        },
        "newLicWin365GroupName": {
            "SelectSimple": {
                "lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB": "lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB",
                "lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB": "lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB"
            }
        }
    }
}
```

The resize runs the *Unassign Windows 365* and *Assign Windows 365* runbooks in sequence; their Azure Automation names are preset in the hidden parameters `unassignRunbook` and `assignRunbook`.

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).


## Location
User → General → Resize Windows365

**Full Runbook name**

rjgit-user_general_resize-windows365

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - GroupMember.ReadWrite.All
    - *Reads license/config group members; the started unassign/assign child runbooks modify membership*
  - Group.ReadWrite.All
    - *Finds license and config groups; group writes happen in the started child runbooks*
  - Directory.Read.All
    - *Reads /subscribedSkus and group license assignments to verify a free Windows 365 license*
  - CloudPC.ReadWrite.All
    - *Backs the started child runbooks reading Cloud PCs and ending the grace period*
  - User.Read.All
    - *Resolves the target user by UPN before resizing*
  - Mail.Send *(optional — feature: Email report)*
    - *The started assign child runbook notifies the user when sendMailWhenDoneResizing is enabled*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### currentLicWin365GroupName

License group the user is removed from; the Cloud PC behind it is deprovisioned.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |
| Portal display name | Current Windows 365 license |

### newLicWin365GroupName

License group that provides the new size. Must differ from the current one.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB |
| Type | String |
| Portal display name | New Windows 365 license |

### sendMailWhenDoneResizing

Sends the user an email once the new Cloud PC is ready.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Notify the user when the resize is done? |

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

### unassignRunbook

Name of the runbook that removes the current assignment. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjgit-user_general_unassign-windows365 |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### assignRunbook

Name of the runbook that assigns the new size. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjgit-user_general_assign-windows365 |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### skipGracePeriod

Deletes the old Cloud PC right away instead of after the 7-day grace period.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Remove the old Cloud PC immediately? |



[Back to Runbook Reference overview](../../README.md)

