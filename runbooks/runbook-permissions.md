---
description: How to grant/deny access to certain runbooks.
---

# Runbook Permissions

## Scope

This addresses how to grant/deny access to certain runbooks in an Azure AD tenant. If you are looking for answers regarding which MS Graph API permissions etc. are needed to run a certain action as a runbook, please have a look at [Azure AD Roles and Permissions](azure-ad-roles-and-permissions.md).

## Overview

"Runbook Permissions" define the visibility of runbooks for certain users. Also certain runbooks can be blocked/hidden globally.

Like the [Runbook Customizations](runbook-customization.md), defining these permissions is done by giving a JSON-formatted configuration as an RealmJoin admin in RealmJoin's web portal at [https://portal.realmjoin.com/settings/runbooks-permissions](https://portal.realmjoin.com/settings/runbooks-permissions) .

### About this guide

We will give a short description of the syntax and then build a full example piece by piece. Feel free to directly go to the full sample and start from [there](runbook-permissions.md#targetentitygroups).

## Configuration Syntax

### Runbook names

Runbooks are referenced by their names as seen in the Azure Automation Account, e.g. `rjgit-group_general_remove-group`.

Wildcards ('\*') can be used to match multiple runbooks. Multiple wildcards can be used in the same string, e.g. `rjgit-*_security_*`. This would all of the following examples:

* `rjgit-org_security_list-inactive-users`
* `rjgit-device_security_enable-or-disable-device`

The prefix `rjgit-` denotes runbooks that are imported from our piblic GitHub repository. Customer-specific runbooks have no prefix, e.g. `user_userinfo_custom-runbook`

### AzureAD Groups

AzureAD groups will be referenced using their Object ID, like `91688d11-9a34-42cd-8d1e-ce617d6c1234`.

## JSON Structure and Example

We will build a full configuration example piece by piece.

A JSON configuration consists of multple sections, but all sections are optional and can be omitted.

It is allowed to add comments using the "//" prefix.

### EnabledRunbookPatterns

This section contains a list of runbooks allowed to be used. If this section is omitted, all runbooks are enabled/allowed by default.

If you define this section, then only runbooks mentioned in this section will be usable by any role / supporter and admin.

#### Example

*   Allow only certain, individual runbooks by giving their full name

    `rjgit-group_general_remove-group`
*   Allow all device related runbooks from our shared repository

    `rjgit-device_*`
*   Allow all shared user runbooks

    `rjgit-user_*`
*   Allow all customer specific (local), user related runbooks

    `user_*`

This implicitely leaves out many group- and all org- based runbooks. Be aware.

```
{
  "EnabledRunbookPatterns": [
    "rjgit-group_general_remove-group",
    "rjgit-device_*",
    "rjgit-user_*",
    "user_*"
  ]
}
```

### DisabledRunbookPatterns

A list of runbook that are globally disabled / forbidden. If this section is omitted or empty, all enabled runbooks (given via [EnabledRunbookPatterns](runbook-permissions.md#enabledrunbookpatterns)) are usable.

Entries in this section take priority over entries in [EnabledRunbookPatterns ](runbook-permissions.md#enabledrunbookpatterns)- the runbooks will be hidden/not be usable for anyone in this tenant.

#### Example

We will reuse the `EnabledRunbookPatterns` section from before.

* Disable all shared (`rjgit-`) runbooks in the `security` category.

```
{
  "EnabledRunbookPatterns": [
    "rjgit-group_general_remove-group",
    "rjgit-device_*",
    "rjgit-user_*",
    "user_*"
  ],
  "DisabledRunbookPatterns": [
    "rjgit-*_security_*"
  ]
}
```

### Roles

In this section you can assign a list of runbooksto an Azure AD group. This allows to define multiple supporter/operator roles in your tenant.

If this section is omitted, all RealmJoin supporters and admins have access to all runbooks given in the previous sections.

If you use this sections and define roles, all users not belonging to a role will not see any runbooks.

#### Example

Continuing with what we have, let us create a device-supporter role `DeviceAdmin` and a user supporter role `UserAdmin`.

We will apply those roles to mutiple Azure AD groups and for each role give a list of allowed runbooks. Be aware - this will restrict the user supporter role to only a small set of runbooks.

Let us add comments ("//") next to the group's object id that help the reader by giving the Azure AD group names.

```json
{
  "EnabledRunbookPatterns": [
    "rjgit-group_general_remove-group",
    "rjgit-device_*",
    "rjgit-user_*",
    "user_*"
  ],
  "DisabledRunbookPatterns": [
    "rjgit-*_security_*"
  ],
  "Roles": {
    "DeviceAdmin": {
      "Groups": [
        "9cbfc0af-c217-41e9-b790-3043788f1234", // 1st Device Supporter AAD Group
        "5555c0af-c217-41e9-b790-3043788f1234"  // 2nd Device Supporter AAD Group - other team
      ],
      "AllowedRunbookPatterns": [
        "rjgit-device_*"
      ]
    },
    "UserAdmin": {
      "Groups": [
        "1234c0af-c217-41e9-b790-3043788f1234" // User Supporter AAD Group
      ],
      "AllowedRunbookPatterns": [
        "rjgit-user_general_assign-or-unassign-license",
        "rjgit-user_mail_*",
        "user_*"
      ]
    }
  }
}
```

Now your `UserAdmin` supporters can for example

* assign licenses to all users in your tenant
* modify email-addresses of all users in your tenant

`DeviceAdmin` supporters can

* wipe any device in your tenant

### TargetEntityGroups

Maybe you have critical VIP users. Not any supporter should be able to wipe a VIP's device or change a VIP's email address. We can use "targeting" to restrict roles on critical users to only special teams.

"Devices" will be targeted by their primary/assigned user but not the device object in Azure AD. This allows to stick to a purely user-based group model.

We assume, Azure AD groups exist that contain critical VIP users. Using this section, we can carefully scope some more critical roles and runbooks for these specific Azure AD groups (= targets).

Obviously, if you omit this section, all users/groups/devices in your tenant are treated as equals.

If you define TargetEntityGroups it should not have any impact on any other group not mentioned in the section.

#### Full Example

(continuing where we left of)

Assume group `0000c0af-c217-41e9-b790-3043788f0000` is our group of VIP users.

We introduce a new AzureAD group `4444c0af-c217-41e9-b790-3043788f4444` containing supporters that are capable of treating the VIPs . These supporters should also have all other basic supporter permissions, so we will add them to the existing roles.

"Restricting" a role will not grant new roles to a supporter.

```json
{
  "EnabledRunbookPatterns": [
    "rjgit-group_general_remove-group",
    "rjgit-device_*",
    "rjgit-user_*",
    "user_*"
  ],
  "DisabledRunbookPatterns": [
    "rjgit-*_security_*"
  ],
  "Roles": {
    "DeviceAdmin": {
      "Groups": [
        "9cbfc0af-c217-41e9-b790-3043788f1234", // 1st Device Supporter AAD Group
        "5555c0af-c217-41e9-b790-3043788f1234", // 2nd Device Supporter AAD Group - other team
        "4444c0af-c217-41e9-b790-3043788f4444"  // VIP Support Crew
      ],
      "AllowedRunbookPatterns": [
        "rjgit-device_*"
      ]
    },
    "UserAdmin": {
      "Groups": [
        "1234c0af-c217-41e9-b790-3043788f1234", // User Supporter AAD Group
        "4444c0af-c217-41e9-b790-3043788f4444"  // VIP Support Crew
      ],
      "AllowedRunbookPatterns": [
        "rjgit-user_general_assign-or-unassign-license",
        "rjgit-user_mail_*",
        "user_*"
      ]
    }
  },
  "TargetEntityGroups": {
    "0000c0af-c217-41e9-b790-3043788f0000": {  // VIP Users - Treat with care!
      "RestrictRoles": {
        "UserAdmin": [
          "4444c0af-c217-41e9-b790-3043788f4444" // VIP Supporters
        ],
        "DeviceAdmin": [
          "4444c0af-c217-41e9-b790-3043788f4444" // VIP Supporters
        ]
      }
    }
  }
}
```
