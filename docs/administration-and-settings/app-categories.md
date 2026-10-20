---
type: RealmJoin Settings
description: >-
  Manage the app categories of a tenant in RealmJoin Portal and use them to
  group packages in the RealmJoin Tray and in the Intune Company Portal.
---

# App Categories

App categories group your packages so users can find them more easily. RealmJoin Portal keeps one list of categories per tenant and uses it for both deployment methods:

* **RealmJoin deployment:** the category is the package's **Group name**. Users see the package under this group in the [RealmJoin Tray](../realmjoin-agent/client-menu/realmjoin-tray.md) menu. Each package has exactly one group name; packages without one appear under **Other**.
* **Intune deployment:** the categories are the Intune app categories of the app. Users can sort and filter by them in the Company Portal. An Intune app can have several categories.

You manage the list under **Settings** > **App Categories**.

## Where the list comes from

The list shows the categories stored for your tenant together with all app categories that exist in Intune, so a category created directly in Intune appears here as well.

When the list is opened for the first time and is still empty, RealmJoin Portal fills it from the group names of your existing RealmJoin packages, the Package Store categories and the app categories in Intune.

{% hint style="info" %}
Reading and changing Intune app categories requires the Graph permission `DeviceManagementApps.ReadWrite.All`. Without it, the list contains only the categories stored in RealmJoin.
{% endhint %}

## Add a category

{% stepper %}
{% step %}
### Open the list

Go to **Settings** > **App Categories**.
{% endstep %}

{% step %}
### Create the category

Select **New Category**, enter a name (up to 127 characters) and select **Submit**.
{% endstep %}
{% endstepper %}

Names are not case-sensitive: you cannot add a category that only differs in upper and lower case from an existing one.

A new category is first added to the RealmJoin list only. RealmJoin creates the matching Intune app category the first time you assign the category to an Intune app.

## Rename a category

Select **Rename** next to the category, enter the new name and select **Submit**. The new name is applied everywhere the category is used:

* the group name of every RealmJoin package that uses it,
* the matching Intune app category, so all Intune apps that use it follow automatically,
* the category list in RealmJoin Portal.

The rename is refused if a category with the new name already exists, or if the category is one of the built-in Intune categories. Every rename is recorded in the [Audit Log](../monitoring-and-logs/audit-log.md).

## Delete a category

Select **Delete** next to the category and confirm with **Confirm Delete**. The category is removed from RealmJoin Portal and from Intune.

A category can only be deleted while no package uses it. The deletion is refused if

* a RealmJoin package uses the category as its group name, or
* an Intune app has the category assigned, or
* the category is one of the built-in Intune categories.

If a package still uses the category, the message names it. To delete the category anyway, first assign a different category to these packages, or [rename](#rename-a-category) the category instead.

## Assign categories to packages

### When subscribing to a package

When you subscribe to a package from the [Package Store](../application-management/packages/package-store/package-store-details.md#app-categories), the subscription dialog lets you pick from the category list:

* **RealmJoin deployment:** select one **Group name**.
* **Intune deployment:** select one or more **Categories**.

### For an existing package

Open the [package details](../application-management/packages/package-details.md) and select **Expert settings**:

* **RealmJoin package:** choose the **Group name**. See [Expert Settings](../application-management/packages/package-settings.md#expert-settings) for the other settings in this dialog.
* **Intune app:** add or remove **Categories**. If a selected category does not exist in Intune yet, RealmJoin creates it when you save.

## Permissions

| Action                                    | Permission                                                                                         | Pre-defined roles |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------- | ----------------- |
| View the category list                    | [`CanReadAppCategories`](permission/custom-roles/available-permissions.md#app-categories)          | Admin, Auditor    |
| Add, rename and delete categories         | [`CanEditAppCategories`](permission/custom-roles/available-permissions.md#app-categories)          | Admin             |
| Change the categories of a single package | [`CanEditAppExpertSettings`](permission/custom-roles/available-permissions.md)                     | Admin, Software Agent |
