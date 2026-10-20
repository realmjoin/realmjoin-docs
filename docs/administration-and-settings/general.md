---
type: RealmJoin Settings
description: >-
  General RealmJoin settings, including runbook sync, portal UI options such as
  the tenant banner logo, package automation defaults and update notifications.
---

# General

## Runbook Sync

If you configure [Process Automation / Runbooks](../automation/runbooks/) in your environment, you can click "Sync runbooks..." to update your runbooks from RealmJoin's public repository.

![](<../.gitbook/assets/image (84).png>)

This will make sure, you have the current state of our runbooks, incl. bugfixes and new functionality. If needed, this will also install needed PowerShell modules in your Azure Automation Account.

## UI Config

The _UI Config_ card changes how RealmJoin Portal looks and behaves for all users of your tenant.

### Show advanced info

When enabled, RealmJoin Portal shows additional technical information to users with the **Admin**, **Auditor** or **Advanced Supporter** role (and to Entra ID Global Administrators). This adds diagnostic views to the detail pages, for example:

* the raw Entra ID, Intune, Autopilot, Defender and RealmJoin data of a device,
* the raw Entra ID and RealmJoin data and the sign-in data of a user,
* the raw data of groups, packages and your organization.

The setting is off by default. The views are controlled by the `CanSee...Json` permissions and `CanSeeUserSignIns`, see [Available Permissions](permission/custom-roles/available-permissions.md).

### Tenant banner logo

RealmJoin Portal can show your company logo in the toolbar at the top of every page and on the [Organization Details](../ugd-management/organization-details.md) page. Choose where the logo appears:

| Option                       | Toolbar | Organization page |
| ---------------------------- | ------- | ----------------- |
| Toolbar + Organization page  | ✓       | ✓                 |
| Toolbar only                 | ✓       | –                 |
| Organization page only       | –       | ✓                 |
| Toolbar only, white backdrop | ✓       | –                 |
| Both, white backdrop         | ✓       | ✓                 |
| No banner                    | –       | –                 |

_Toolbar + Organization page_ is the default. The toolbar has a dark background, so the two _white backdrop_ options put the logo on a white area in the toolbar. Use them if your logo is hard to read on a dark background. The white backdrop only applies to the toolbar.

The logo is the **Banner logo** from your tenant's [Entra ID company branding](https://learn.microsoft.com/en-us/entra/fundamentals/how-to-customize-branding) (default sign-in experience). RealmJoin does not store a logo of its own. To change the logo, upload a new banner logo in the Entra admin center under **Company branding**.

{% hint style="info" %}
If no banner logo is configured in your Entra ID company branding, no logo is shown and the previews on the card show a placeholder. RealmJoin Portal caches the logo for up to one hour, so a new banner logo can take that long to appear.
{% endhint %}

## Package Automation Defaults

If you source packages from RealmJoin's [Package Store](../application-management/packages/package-store/), you can use [automation ](../application-management/packages/package-details.md#automation)to keep these packages always up to date.

![Automation defaults for a package](<../.gitbook/assets/image (199).png>)

The settings are:

* **AutoDeployMain** - Automatically deploy new versions of this package to your users. ("Main" subscription)
* **AutoDeployMainDeferInDays** - Wait for this number of days to pass before publishing a new version to "main". This is usefull to avoid stress for users/clients if multiple package versions are published rapidly.
* **AutoDeployPreview** - Automatically deploy new versions of this package to your pilot users. ("Preview" subscription)
* **AutoDeployPreviewDeferInDays** - Wait for this number of days to pass before publishing a new version to "preview".
* **AutoDeployAtNight** - Schedule automatic deployment during night time
* **Select target timezone** - If you use AutoDeployAtNight, use this Time Zone to indicate when "at night" is.

See [Package Details](../application-management/packages/package-details.md#automation) for more information on Package Automation.

## Group Naming Scheme

RealmJoin Portal can dynamically create and manage Entra groups for features like [package assignment](../application-management/packages/package-details.md#assignments) and [remediation script assignment](../automation/remediation-scripts.md#assignment).

### App / Package Deployment

RealmJoin can create assignment groups for Intune and RealmJoin Client packages. Use this to define the naming pattern the groups.

<figure><img src="../.gitbook/assets/image (228).png" alt=""><figcaption><p>Package Deployment Group Naming Scheme</p></figcaption></figure>

You can use the following variables:

* **$vendor** - Name of the software vendor (if available)
* **$product** - Name of the software title
* **$appName** - Full name (vendor and product) of the software
* **$modifier** - either nothing, "available", "preview" or "uninstall"
* **$groupName** - (only in description) Name of the Managed Group

### Remediation Scripts

If you use [RealmJoin managed Intune Remediation scripts](../automation/remediation-scripts.md#managed-scripts), you can define the naming scheme for [Managed Groups](../automation/remediation-scripts.md#managed-groups).

<figure><img src="../.gitbook/assets/image (152).png" alt=""><figcaption><p>Remediation Scripts Group Naming Scheme</p></figcaption></figure>

You can use the following variables:

* **$healthScriptName** - Name of the Managed Remediation Script
* **$modifier** - either "included" or "excluded" (Assignment vs. Exception)
* **$groupName** - (only in description) Name of the Managed Group

## Additional Update Notifications

RealmJoin sends notification emails about packages sourced from the [Package Store](../application-management/packages/package-store/) when

* a new version of the package is available in the Package Store,
* a new version is ready to be deployed manually, or
* an automatic deployment of a new version is planned (see [Package Automation Defaults](#package-automation-defaults)).

In the field **Send additional update notifications to …** on the _App Config_ card, you can enter email addresses that receive these notifications for **every** package in your tenant. Separate multiple addresses with semicolons, e.g. `foo@example.com; bar@example.com`.

This complements the [Technical Application Owners](../application-management/packages/package-settings.md#technical-application-owners) (TAO) of a package:

* **Technical Application Owners** are set per package and only receive notifications for that package, and only if notifications are enabled in the package's Config.
* **Additional update notification recipients** are set tenant-wide and receive the notifications for all packages, independent of the TAO settings.

{% hint style="info" %}
Invalid email addresses are dropped when saving, so check the field after saving. The list holds roughly 200 characters in total. For more recipients, use a distribution list or shared mailbox.
{% endhint %}

## Managed App Priority Cascade

The _App Config_ card also contains the tenant-wide switch **Classic priority cascade for managed apps**. It decides which assignment wins when a user or device is a member of both the Main (Required) and the Available group of a managed package:

* **Off** (default) - managed cascade: Available wins over Main (uninstall > update > preview > available > mandatory).
* **On** - classic cascade: Main wins over Available (uninstall > update > preview > mandatory > available).

Changing the switch asks for confirmation and takes effect immediately for every user and every managed package that has no per-package override. Individual packages can deviate from the tenant default via the _Priority cascade_ setting in their [Expert Settings](../application-management/packages/package-settings.md#expert-settings).

See [Assignment priority and conflicts](../application-management/packages/package-deployment.md#assignment-priority-and-conflicts) for the full evaluation order, including Exclude and Uninstall.

## Client Configuration

With this tenant setting you can configure the timespan in which the RealmJoin Agent detects the primary user.

<figure><img src="../.gitbook/assets/image (415).png" alt=""><figcaption></figcaption></figure>

## LAPS Configuration

With this tenant setting you can configure the expiration time of the RealmJoin LAPS Support Account.

<figure><img src="../.gitbook/assets/image (416).png" alt=""><figcaption></figcaption></figure>
