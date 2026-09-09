---
type: Application Management
description: >-
  RealmJoin package subscriptions and assignment types such as Main (Required)
  and Available, for deploying software via RealmJoin or Intune, and how
  conflicting user and device assignments are prioritized.
---

# Package Configuration and Assignments

{% embed url="https://www.youtube.com/watch?v=BdF3rvMbjFs" %}

## Managed Subscription

Packages subscribed as managed come with managed user groups. There are different types of groups available that can be chosen based on your scenario.

{% hint style="info" %}
Managed packages are the preferred way to deploy software to your users. You can combine it with automated package updates and lifecycle to ensure your users receive latest features and patches.
{% endhint %}

### **Main (Required)**

RealmJoin or Intune will automatically install the application. These applications are mandatory and both solutions will continuously attempt to install the application, if not found on the device.

### **Available**

{% tabs %}
{% tab title="RealmJoin" %}
The application will appear in the RealmJoin Agent tray and will require the user to initiate the download and installation manually.

<figure><img src="../../.gitbook/assets/image (351).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Intune" %}
The application will appear in Company Portal -> Apps and will require the user to initiate the download and installation manually.

<figure><img src="../../.gitbook/assets/image (352).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}

### Preview

Users and devices in the Preview group will receive the latest version of the package before the other groups. Preview settings are configurable through the [Automation tab](package-details.md#automation).

### Uninstall

RealmJoin or Intune will uninstall the package from the assigned users and devices. Adding a user or device to the Uninstall group will remove them from all other groups.

An Uninstall assignment takes precedence over Main and Available assignments, no matter on which level it is made: a device in the Uninstall group leads to the package being uninstalled even if the signed-in user is in the Main group, and vice versa. Only an [Exclude](package-deployment.md#exclude) assignment ranks higher, see [Assignment priority](package-deployment.md#assignment-priority-and-conflicts).

### Update

The Update group is created on demand and automatically onboards loose installations of a software title into management, so that new versions — including security patches — also reach those devices. It is the mechanism that keeps Intune **Available** apps up to date, by temporarily assigning outdated devices as **Required**.

For details, see [Update Group](update-group.md).

### Exclude

Needs to be explicitly activated through "More" > "Exclude assignments" (like shown in the [picture below](package-deployment.md#enable-additional-and-restore-default-groups)). Users and devices in the specified group will be excluded from assignments all over the package and associated managed groups.

{% hint style="info" %}
This option should only be used in specific cases and is not intended to be used to manage assignment conflicts. You should always manage assignments with clear user to group assignments, without the need of using an exclude mechanic. We strongly advise against multi-layer assignment constructs.
{% endhint %}

#### Usage

The Exclude assignment of groups is used to ensure that users in the assigned exclude group are not managed within the package managed groups. It will not remove users from managed groups within the same package. Instead, it makes sure that certain packages are never assigned to the same user simultaneously.

For example, you can use the Exclude function to prevent a user, assigned to a 64-bit Adobe Reader package group, from also receiving the 32-bit version. Simply assign the used 64-bit package group as an exclude to the 32-bit package.

{% hint style="warning" %}
Exclude is evaluated before anything else. If the signed-in user _or_ the device is a member of an Exclude group of a package, no other assignment of that package is evaluated at all — not Main, Available, Preview, Update, a direct user assignment, and **not Uninstall** either. The package is simply ignored on that device: it is neither installed nor uninstalled. See [Assignment priority](package-deployment.md#assignment-priority-and-conflicts).
{% endhint %}

### Assignment priority and conflicts

Managed packages can be assigned to users (via user groups or directly) and to devices (via device groups, see [Assign Packages to Devices](../../realmjoin-agent/realmjoin-client/multi-user-devices.md#option-a-assign-packages-to-devices)). Because a device and its signed-in user can end up in different groups of the same package, the RealmJoin backend resolves conflicts deterministically when it renders the configuration for a device.

In managed packages, group management is handled by the RealmJoin Portal, which uses the GUID of each group after creation. This enables the portal to identify the provisioning type associated with each group and to prioritize between them. This ensures deterministic behavior in scenarios where a user or device is mistakenly assigned to multiple provisioning groups.

For each package, the assignments of the signed-in user, of the user's groups and of the device's groups are collected and evaluated in this order:

1. **Exclude** — if _any_ of the collected assignments is an Exclude assignment, the package is dropped entirely. Nothing else is evaluated, including Uninstall.
2. **Uninstall** — if _any_ of the remaining assignments is an Uninstall assignment, the package is uninstalled, regardless of whether it comes from a user group, a device group or a direct user assignment.
3. **Direct user assignment** — a package assigned directly to the user (not via a group) takes precedence over all group assignments, whether from user groups or device groups.
4. **Group assignments** — user groups and device groups are treated alike and ranked by their provisioning type (high to low):\
   \[Update] - Preview - Available - Required\
   If the user's group and the device's group have the same provisioning type, the user's group assignment is used.

Effectively, the prioritization order is (high to low):

\[Exclude] - Uninstall - \[Update] - Preview - Available - Required

{% hint style="info" %}
Device group assignments are only evaluated if device assignment is enabled for your tenant. Please ask RJ support, if the device assignment feature is active in your tenant. Without it, group memberships of the device — including Exclude and Uninstall groups — are not taken into account.

An Exclude or Uninstall assignment is ignored if the assignment itself is filtered out by its expert settings on the current device (e.g. _Only in VDI_ / _Ignore in VDI_, _Only on hybrid-joined devices_ / _Ignore on hybrid-joined devices_, _Ignore on private devices_), see [Expert Settings](package-settings.md#expert-settings).
{% endhint %}

{% hint style="warning" %}
The rules above describe how the RealmJoin Agent resolves assignments. For packages deployed via Intune, the same groups are assigned to the Intune app and Intune applies its own conflict resolution. In particular, Intune does not support excluding a device group from a user group assignment or vice versa. Refer to the [Microsoft documentation on app assignment conflicts](https://learn.microsoft.com/en-us/intune/intune-service/apps/apps-deploy#how-conflicts-between-app-intents-are-resolved) for details.
{% endhint %}

### Enable additional and restore default groups

<figure><img src="../../.gitbook/assets/image (393).png" alt=""><figcaption></figcaption></figure>

Via the "More"-Button you can activate the optional update group, manage exclude assignments and also restore the default managed groups in case they were deleted.

### Changing Assignments

{% hint style="warning" %}
Users and devices should only be in one RealmJoin managed group at any given time.
{% endhint %}

Users and devices can easily be moved across groups using the _Managed users_ function.

<figure><img src="../../.gitbook/assets/image (353).png" alt=""><figcaption></figcaption></figure>

Selecting Main, Preview, Available and Uninstall will add the user to the chosen group and remove the user from all other groups relevant to the package.

Selecting Assign will add users to the Main group by default.

## Basic Subscription (Legacy)

Basic packages do not have any associated Microsoft Entra groups. You will have to manually assign groups, devices or users.

Groups, devices and users that are assigned to a Basic package will be assigned as Available by default and can be changed using the \[change settings] button.

<figure><img src="../../.gitbook/assets/image (355).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (356).png" alt=""><figcaption></figcaption></figure>

#### Migrating from Basic to Managed subscriptions

To migrate a legacy basic package subscription to the standard managed format, the RealmJoin Portal provides a built-in conversion function. In the assigned groups section of the basic subscribed application package, the "Convert to Managed App" option is available behind the "More" button.

This feature creates the default managed subscription groups, in which the legacy users can be added vial bulk operation or nesting.

<figure><img src="../../.gitbook/assets/image (421).png" alt=""><figcaption><p>Preparation to migrate a basic app to a managed app</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (422).png" alt=""><figcaption><p>Result of the migration process</p></figcaption></figure>
