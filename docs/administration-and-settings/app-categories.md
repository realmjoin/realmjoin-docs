---
type: RealmJoin Settings
description: >-
  Manage the app categories of a tenant in RealmJoin Portal and use them to
  group packages in the RealmJoin Tray and in the Intune Company Portal.
---

# App Categories

App categories determine under which heading end users see a package. RealmJoin Portal keeps one category list per tenant and uses it for both deployment methods:

* **RealmJoin deployment:** the category is the package's **Group name**. Users see the package under this group in the [RealmJoin Tray](../realmjoin-agent/client-menu/realmjoin-tray.md) menu. Each package has exactly one group name; packages without one appear under **Other**.
* **Intune deployment:** the categories are Intune app categories (`mobileAppCategory` in Microsoft Graph) assigned to the app. The Company Portal uses them to filter apps. An Intune app can have several categories.

You manage the list under **Settings** > **App Categories**.

## Where the list comes from

The list is the union of the categories stored for the tenant in RealmJoin and all app categories in the tenant's Intune, compared case-insensitively. A category created directly in Intune therefore appears here as well.

If no categories are stored for the tenant yet, RealmJoin Portal fills the list the first time it is loaded, from:

* the group names of the tenant's RealmJoin packages,
* the Package Store categories (only if the tenant already has RealmJoin packages),
* the app categories in Intune.

{% hint style="info" %}
Intune app categories are read and written with the Graph permission `DeviceManagementApps.ReadWrite.All`. Without it, the list contains only the categories stored in RealmJoin and deleting a category fails. Renaming needs the permission when Intune deployment is enabled for the tenant.
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

Names are compared case-insensitively: you cannot add a category that differs from an existing one only in upper and lower case.

A new category is stored in RealmJoin only. The matching Intune app category is created the first time the category is assigned to an Intune app.

## Rename a category

Select **Rename** next to the category, enter the new name and select **Submit**. RealmJoin Portal changes the name in this order:

1. The matching Intune app category, if Intune deployment is enabled for the tenant. Intune apps reference the category by ID, so their category assignments stay intact.
2. The group name of every RealmJoin package that uses the category.
3. The category list stored in RealmJoin.

The three stores are not updated in one transaction. If a step fails, the old name stays in the list; renaming it again completes the remaining steps.

The rename is refused if a category with the new name already exists, or if the category is a built-in Intune category (one of the defaults Intune creates, which cannot be changed). Every rename is written to the [Audit Log](../monitoring-and-logs/audit-log.md) together with the number of RealmJoin packages changed.

## Delete a category

Select **Delete** next to the category and confirm with **Confirm Delete**. The category is removed from the list stored in RealmJoin and, if it exists there, from Intune.

A category can only be deleted while no package uses it. The deletion is refused if

* a RealmJoin package uses the category as its group name, or
* an Intune app has the category assigned, or
* the category is a built-in Intune category.

If a package still uses the category, the message names the first package found. Assign a different category to all packages that use it before deleting it, or [rename](#rename-a-category) the category instead.

## Assign categories to packages

### When subscribing to a package

When you subscribe to a package from the [Package Store](../application-management/packages/package-store/package-store-details.md#app-categories), the subscription dialog lets you pick from the category list:

* **RealmJoin deployment:** select one **Group name**.
* **Intune deployment:** select one or more **Categories**.

### For an existing package

Open the [package details](../application-management/packages/package-details.md) and select **Expert settings**:

* **RealmJoin package:** choose the **Group name**. See [Expert Settings](../application-management/packages/package-settings.md#expert-settings) for the other settings in this dialog.
* **Intune app:** add or remove **Categories**. A selected category that does not exist in Intune yet is created there when you save.

## Permissions

| Action                                    | Permission                                                                                         | Pre-defined roles |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------- | ----------------- |
| View the category list                    | [`CanReadAppCategories`](permission/custom-roles/available-permissions.md#app-categories)          | Admin, Auditor    |
| Add, rename and delete categories         | [`CanEditAppCategories`](permission/custom-roles/available-permissions.md#app-categories)          | Admin             |
| Change the categories of a single package | [`CanEditAppExpertSettings`](permission/custom-roles/available-permissions.md)                     | Admin, Software Agent |
