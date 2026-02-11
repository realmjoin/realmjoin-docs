# Package Subscription Options



{% embed url="https://www.youtube.com/watch?v=QYBx9yto560" %}
Video tutorial
{% endembed %}

<figure><img src="../../../.gitbook/assets/image (5) (1).png" alt=""><figcaption><p>Package Store details page</p></figcaption></figure>

## Subscription

<figure><img src="../../../.gitbook/assets/image (35) (1).png" alt=""><figcaption><p>Subscribe Buttons</p></figcaption></figure>

Packages will either be pushed directly to Intune as .intunewin packages or deployed using the RealmJoin agent on the device (recommended).&#x20;

## Subscription Type

Packages can be subscribed as _managed_ or _basic_.

* _Basic_ packages are available for assignment to groups or users and do not offer additional features. If you've used RealmJoin Classic (2015-2024), you'll be familiar with Basic packages.&#x20;
* _Managed_ packages leave the group management and assignment to the RealmJoin backend. A fixed number if groups is created. The assignment of the package is only available to those. The groups include preview and uninstall groups. The static connection between the RealmJoin backend and the Entra group also allows utilize additional features like the automatic update of packages if a new version is published in RealmJoin. Find more on the managed groups [here](https://docs.realmjoin.com/app-management/packages/package-deployment#managed-deployment)



<figure><img src="../../../.gitbook/assets/image (344).png" alt=""><figcaption><p>Application Groups</p></figcaption></figure>

The created Entra ID groups can be managed from both the RealmJoin Portal and Microsoft Entra ID.&#x20;

## Package Types

Nearly all packages from the RealmJoin store can either be subscribed for RealmJoin Agent or Intune driven deployment.&#x20;

### RealmJoin Deployment

RealmJoin driven deployment relies on the RealmJoin agent installed on the device. Using a modified Chocolatey engine and Powershell, all code and installation commands are executed directly on the device. Binaries are downloaded during the installation.&#x20;

### Intune Deployment

The Intune driven deployment pushes the .intunewin version of the package directly into the tenant. It can be managed either from the RealmJoin portal or in Intune directly. The .intunewin packages contain all binaries as well as a Powershell based deploy kit.&#x20;

{% hint style="info" %}
As of today, we recommend RealmJoin driven deployment, as it offers more options and manageability.&#x20;
{% endhint %}

## App Categories

The name and group name/category can now be customized when subscribing to a new package. This feature allows for better organization and easier access to applications within both RealmJoin and Intune environments.

**RealmJoin Deployment**

* **Display**: The application will be displayed under the chosen Group Name in the RealmJoin Tray Menu.
* **Customization**: The appropriate Group name should be selected during the subscription process to ensure the application is categorized correctly.

**Intune Deployment**

* **Display**: The application will be displayed under the chosen category in Intune and in the Company Portal for assigned users.
* **Customization**:
  * Multiple categories can be selected for an application.
  * Categories can be edited afterwards in the "Expert Settings" of each package.
  * Categories can be managed under the settings of the portal to ensure they align with organizational needs.

<figure><img src="../../../.gitbook/assets/image (42) (1).png" alt=""><figcaption><p>Configuration of Category/Group Name during the subscription process</p></figcaption></figure>

The total of categories can be managed from the _App Categories_ tab in the general settings section in the RealmJoin portal.&#x20;

<figure><img src="../../../.gitbook/assets/image (41) (1).png" alt=""><figcaption><p>All categories available in the tenant</p></figcaption></figure>

## Multiple package subscriptions

### Craft Packages (Suffix Configuration or #-Notation)

Sometimes it is necessary to have multiple subscriptions of one craft package. Those craft packages are often used for configurations like printer or network drive mapping and need to be subscribed and assigned multiple times to users because there are multiple printer or network drives to be mapped. Therefore it is important to have a suffix, because RealmJoin only accepts every package ID once. The suffix is modifying the unique ID from "this-id" to "this-id#\[your-suffix]".

While subscribing to a craft package from the store, a suffix is automatically added to the ID of the package. If you want to edit the ID, you can simply click on "Set suffix" next to the orange dialog box showing the pre-defined ID. &#x20;

<figure><img src="../../../.gitbook/assets/image (12).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
The suffix is only available for RealmJoin Deployment since it is not necessary for Intune Deployment!
{% endhint %}

### Choco Packages

If you need multiple configurations of an application, e.g. "Microsoft 365 Apps for Enterprise", you can subscribe it multiple times and change the name during the subscription process, i.e. "Microsoft 365 Apps for Enterprise - DE", which will be reflected in the managed package groups created by RealmJoin.&#x20;

{% hint style="danger" %}
**Suffixes are not required—and therefore not available—for these types of packages, as each user can only be assigned and install a single instance of an application with a specific configuration at any given time. This limitation ensures that identical Chocolatey or IntuneWin applications, which share the same unique identifier, cannot be deployed to the same user more than once. Attempting to assign multiple copies of the same app with the same ID will result in conflicts and is not supported.**
{% endhint %}

You can change the name by choosing your package and subscription type and before hitting continue clicking next to the name in the top left corner to adjust it.&#x20;

## Package Properties

### Core Properties

Every package's details page will show an overview of the core properties such as the package's **Display Name**, **Description** and **Package ID** ("Unique RJ ID") on the left side of the screen. This part will not scroll and be always visible in any tab.

### Status Fields

Also displayed on the left side of the screen are four status fields for a package, displayed as tags below the package name and publisher name.

![](<../../../.gitbook/assets/image (121).png>)

These fields are binary - they are set to one of two possible values. The text of each field changes accordingly. Some of the fields are also color-coded for easier glanceability.

* **Maintained / Unmaintained:** RealmJoin will provide new versions / updates of maintained packages on a regular basis.\
  Automatic package management can be applied to keep the software delivered by these packages permanently up-to-date in your environment.
* **Generic / Custom:** Generic packages are available to all customers / environments. Custom packages are not globally available to all customers. In most cases this is a custom software package created specifically for your environment.
* **Billable / Non-Billable:** Provisioning of this package will count towards your package usage quota - if you have one. Currently all publicly available packages are billable.
* **Free to Use / Needs License:** Does this software need a commercial license to be used?

### MS Security Center Software Inventory (TVM) entry

If available, a link to this software title's [MS Security Center Software Inventory (TVM)](https://security.microsoft.com/software-inventory/applications)'s entry will be displayed. There you can check for known security issues and outdated versions of this software in your organization.

![An Application's TVM Entry](<../../../.gitbook/assets/image (113).png>)

An appropriate license from Microsoft is needed to access TVM.

This page allows to examine your current security posture, incl. installed versions and distribution on devices as well as security recommendations regarding this software title.

### Version

![Available Version vs Provisioned Package](<../../../.gitbook/assets/image (259).png>)

Also displayed on the left side of the screen is the version of the software package.

If you already provisioned the package to your environment, a link to the provisioned package in [Package Management](../package-management.md) will be displayed. The link will show the name and version of the provisioned package.

## Tabs

The right side of the screen shows the contents of the current tab.

The following tabs are available:

### Overview / Subscribe

<figure><img src="../../../.gitbook/assets/image (342).png" alt=""><figcaption><p>Overview and Provisioning</p></figcaption></figure>

#### Title, Description and other info

This tab will show the long description, license and technical help information of a package.

#### Subscribe / Provisioning

This tab also shows the Subscribe-Buttons for this package. See [Subscribe to Package](../package-deployment.md).

### Versions

The package's changelog shows when the packages has been updated in RealmJoin's repository plus a short description of changes.

<figure><img src="../../../.gitbook/assets/image (343).png" alt=""><figcaption><p>App Package Changelog</p></figcaption></figure>
