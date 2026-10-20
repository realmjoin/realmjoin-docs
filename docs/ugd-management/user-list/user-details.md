---
type: User, Group & Device Management
description: >-
  RealmJoin user details show a single user's profile, sign-in, devices,
  groups, app roles and software, plus runbooks, settings and effective
  RealmJoin roles.
---

# User Details

This page shows detailed information about a single user object. Open it by clicking a user in the [user list](./) or anywhere a user is linked in RealmJoin Portal.

The left side shows the user's core properties and stays visible in every tab. The right side shows the selected tab.

{% hint style="info" %}
Which tabs, sections and actions you see depends on your [role](../../administration-and-settings/permission/pre-defined-roles.md) or [custom role permissions](../../administration-and-settings/permission/custom-roles/available-permissions.md#user-management).
{% endhint %}

## User Summary

![](<../../.gitbook/assets/image (196).png>)

### Status information

Badges and dates show the state of the user object:

* **Enabled** / **Disabled** - Whether the user can sign in. A disabled user also shows the note _Disabled in Azure AD_ at the bottom of the summary.
* **Member** - The user is a native user in this tenant/organization
* **Guest** - This is an external user from a different organization
* **DE/US**... - Two letter code designating the user's [usage location](https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/licensing-groups-resolve-problems#usage-location-isnt-allowed) which is relevant for licensing.
* ![](<../../.gitbook/assets/image (189).png>) **Created** - Object creation date
* ![](<../../.gitbook/assets/image (263).png>) **Last activity** - The user's most recent sign-in

### Properties

Below the status, the summary lists the user's directory properties, if set:

* **Mail**, mobile phone (**M**) and business phone (**B**), and the preferred language. **NO MAILBOX** marks a user without a mail address.
* **First Name**, **Last Name**, **Job Title**, **Department**, **Office** and **UPN**
* **Manager**, linked to the manager's details page
* **Company** and the address (**Street**, **City**, **Postal code**, **State**, **Country**)
* **Entra ID** - The user's object ID. Click it to copy it to the clipboard.
* **On Premises Domain** - For users synchronized from Active Directory

### Last sign-in

If the user has signed in recently, the summary also shows details of the latest sign-in:

* **Last sign-in** - The application used, and whether the sign-in came from a browser or a client app
* **Cond. Access** - The Conditional Access result and the authentication requirement (for example single-factor or multifactor)
* **MFA Details** - The authentication method used, if any
* **Location** - City, region and country, derived from the sign-in IP address

## Overview Tab

The main tab. The **Sections** list on the left jumps to each section on the page. **External Links** open the user in the Intune admin center (**Intune Profile**) and in Microsoft Entra (**Sign Ins**, **Audit Log**).

### Devices

All Entra ID devices of the user, split into **Compliant Devices** and **Non-compliant Devices**. Each device shows:

* An **Entra** badge - highlighted when the device is Entra ID joined, dimmed when it is only Entra ID registered
* An **M** badge - highlighted when the device is managed by Intune
* The device name (linked to its [device details](device-details.md)), operating system and version
* **Last Activity** - The approximate time of the device's last sign-in

### Groups and Teams

All groups the user is a member of, including memberships inherited through nested groups. Groups are bucketed by the RealmJoin group prefixes configured for your tenant (for example license, app or configuration groups); groups that match no prefix appear under **Other**. Teams-enabled groups are listed separately under **Teams**.

Each group shows three badges and its member count:

* **S** / **U** - Security group or Unified (Microsoft 365) group
* **S** / **D** - Static or dynamic membership
* **T** - Highlighted when the group is a Team

### App Roles

The enterprise application roles assigned to the user. **Access** shows whether the role is assigned **Direct** or through a group (linked).

### Proxy Addresses

The user's mail addresses (for example SMTP aliases), each with its address type. The primary address is shown in bold.

### RealmJoin software

Shown when [RealmJoin deployment](../../application-management/deployment-methods.md) is enabled for your tenant. The section lists the user's devices with a number each, then a table of the software assigned to the user with the **Configured** version and one column per device.

Hover over a device cell to see its state, for example:

* _Up to date_ (blue)
* _Outdated_, with whether Auto-Upgrade or Mandatory is set (red)
* _Failed n time(s) with last exit code c_
* _Installed, but not configured (anymore)_
* _Available to user, but not installed_
* _Not available for this device_

## Runbooks Tab

If you have been given Supporter or Admin permissions, this gives you access to runbooks that can be executed on this user object. For example to change an email address for a user.

Each runbook shows its description, recent runs and their status. Use **New Run** to start a runbook or **Schedule** to plan a run (if scheduling is enabled for that runbook).

See [Process Automation](../../automation/runbooks/) for more information.

## Self Service Tab

Shown when [Self Service Forms](../../administration-and-settings/self-service-forms.md) are enabled for your tenant. It lists the forms this user has submitted, with the **Form**, the **Email** delivery status (for example _Sent_ or _Rejected_), the **Webhook** result and when it was **Created**. Use **View** to see the submitted form.

## Settings Tab

You can assign Key-Value pairs of data to specific users to control RealmJoin Clients behavior for this user.

Most of the time this is used to overwrite settings configured on a group or for all users.

<figure><img src="../../.gitbook/assets/image (120).png" alt=""><figcaption><p>Settings overview on a user</p></figcaption></figure>

You can add a setting assigned to this user using <img src="../../.gitbook/assets/image (91).png" alt="" data-size="line">, alternatively open an existing setting by clicking on its name/key or search for a setting by name/key.

Clicking a name/key will open a UI allowing you to manipulate/create the setting.

<figure><img src="../../.gitbook/assets/image (134).png" alt=""><figcaption><p>Setting editor</p></figcaption></figure>

Be aware: The value of the setting must be valid JSON, which includes singular values like `true` or strings (without brackets).

The switches in the lower half of the editor scope the setting to certain devices:

* **Only in VDI** / **Ignore in VDI** - Apply the setting only on, or never on, VDI devices (Windows 365, Azure Virtual Desktop)
* **Only on hybrid-joined devices** / **Ignore on hybrid-joined devices** - Apply the setting only on, or never on, hybrid-joined devices
* **Ignore on private devices** - Do not apply the setting on personal devices

Please see [Available Settings](../user-and-group-settings/additional-settings.md) for more information on which settings can be used.

## Roles & Policies Tab <a href="#roles-and-policies" id="roles-and-policies"></a>

Shows the RealmJoin Portal roles and permissions this user has. Use it to find out why a user cannot see or do something in the Portal.

* **RealmJoin Roles** - The [RealmJoin roles](../../administration-and-settings/permission/pre-defined-roles.md) the user holds and how each is **Assigned via**: a group, an Entra ID role or an app role.
* **Policies** - Each [permission](../../administration-and-settings/permission/custom-roles/available-permissions.md) with its **Status** (_Active_ or _Inactive_) and the roles it is **Granted via**. A _Custom Role_ badge marks permissions from a custom role, and _Blocked by condition_ marks permissions whose conditions are not met. Turn off **Only active** to also see inactive permissions.

{% hint style="info" %}
Roles are evaluated as they would apply at the user's next sign-in. Eligible but not activated PIM roles are not included.
{% endhint %}

This tab is available to Admins and Auditors.

## Data Sources

The icons on the right of the tab bar show the raw [data sources](../user-group-device-management.md#data-sources) as JSON: **Entra ID Data**, **Sign-In Data** (the last 10 sign-ins) and **RealmJoin Data**. They are available to Admins, Advanced Supporters and Auditors when _Show advanced info_ is enabled in [Settings](../../administration-and-settings/general.md).
