---
title: Unassign Windows365
description: Remove the Windows 365 Cloud PC of this user
---

## Description
Removes the Windows 365 license or Frontline assignment of this user and, unless another Cloud PC remains, the provisioning and user settings groups, which deprovisions the Cloud PC. Data stored only on the Cloud PC is lost. Optionally the grace period is skipped so the Cloud PC is deleted right away.

## Offer the license groups as a dropdown

The license field is a text field by default. Offer the license groups (or Frontline provisioning policy groups) of your tenant as a dropdown via runbook customization:

```json
"rjgit-user_general_unassign-windows365": {
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

The group name prefixes (`cfgProvisioningGroupPrefix`, `cfgUserSettingsGroupPrefix`, `licWin365GroupPrefix`) decide which of the user's groups count as Windows 365 groups; adjust them in the same place when your naming differs.

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).


## Location
User → General → Unassign Windows365

**Full Runbook name**

rjgit-user_general_unassign-windows365

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
    - *Resolves the target user by UPN for the group member removals*
  - GroupMember.ReadWrite.All
    - *Reads group members and removes the user from the Windows 365 groups*
  - Group.ReadWrite.All
    - *Finds license and config groups and reads their assigned licenses*
  - CloudPC.ReadWrite.All
    - *Reads provisioning policies and Cloud PCs and ends the grace period to remove the Cloud PC*
  - Organization.Read.All
    - *Reads /subscribedSkus to map the license group's SKU in the dedicated plan path*


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

License group to remove the user from, or the name of the Frontline provisioning policy whose assignment is removed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |
| Portal display name | Windows 365 license or Frontline policy to remove |

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

### licWin365GroupPrefix

Name prefix that identifies Windows 365 license groups. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | lic - Windows 365 Enterprise - |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### skipGracePeriod

Deletes the Cloud PC right away instead of after the 7-day grace period.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Remove the Cloud PC immediately? |

### KeepUserSettingsAndProvisioningGroups

Leaves the user in the provisioning and user settings groups and removes only the license.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Keep provisioning and user settings groups? |



[Back to Runbook Reference overview](../../README.md)

