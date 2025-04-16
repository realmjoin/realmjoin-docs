# Application Store Details



{% embed url="https://www.youtube.com/watch?v=QYBx9yto560" %}
Brand new video tutorial
{% endembed %}

<figure><img src="../../../../.gitbook/assets/image (310).png" alt=""><figcaption><p>Package Details</p></figcaption></figure>

This page will show detailed information for a single package from the package store and allows to provision this package to your environment.

## Package Types

Nearly all packages from the RealmJoin store can either be subscribed for RealmJoin Agent or Intune driven deployment.&#x20;

### RealmJoin Deployment

RealmJoin driven deployment relies on the RealmJoin agent installed on the device. Using a modified Chocolatey engine and Powershell, all code and installation commands are executed directly on the device. Binaries are downloaded during the installation.&#x20;

### Intune Deployment

The Intune driven deployment pushes the .intunewin version of the package directly into the tenant. It can be managed either from the RealmJoin portal or in Intune directly. The .intunewin packages contain all binaries as well as a Powershell based deploy kit.&#x20;

{% hint style="info" %}
As of today, we recommend RealmJoin driven deployment, as it offers more options and manageability.&#x20;
{% endhint %}

## Subscription Type

Packages can be subscribed as _managed_ or _basic_.

* _Basic_ packages are available for assignment to groups or users and do not offer additional features. If you've used RealmJoin Classic (2015-2024), you'll be familiar with Basic packages.&#x20;
* _Managed_ packages leave the group management and assignment to the RealmJoin backend. A fixed number if groups is created. The assignment of the package is only available to those. The groups include preview and uninstall groups. The static connection between the RealmJoin backend and the Entra group also allows utilize additional features like the automatic update of packages if a new version is published in RealmJoin.

## Multiple package subscriptions

### Craft Packages

Sometimes it is necessary to have multiple subscriptions of one craft package. Those craft packages are often used for configurations like printer or network drive mapping and need to be subscribed and assigned multiple times to users because there are multiple printer or network drives to be mapped. Therefore it is important to have a suffix, because RealmJoin only accepts every package ID once. The suffix is modifying the unique ID from "this-id" to "this-id#\[your-suffix]".

You can set the suffix, after choosing the subscription type, next to the continue button.

{% hint style="info" %}
The option to set a suffix is only available for RealmJoin Deployment!
{% endhint %}

### Choco Packages

If you need multiple configurations of an application, e.g. "Microsoft 365 Apps for Enterprise", you can subscribe it multiple times and change the name during the subscription process, i.e. "Microsoft 365 Apps for Enterprise - DE", which will be reflected in the managed package groups created by RealmJoin. A suffix is not needed and therefore not available for these type of packages because users can only have one application with one configuration assigned and installed at a time.

You can change the name by choosing your package and subscription type and before hitting continue clicking next to the name in the top left corner to adjust it.&#x20;

## Package Properties

### Core Properties

Every package's details page will show an overview of the core properties such as the package's **Display Name**, **Description** and **Package ID** ("Unique RJ ID") on the left side of the screen. This part will not scroll and be always visible in any tab.

### Status Fields

Also displayed on the left side of the screen are four status fields for a package, displayed as tags below the package name and publisher name.

![](<../../../../.gitbook/assets/image (112).png>)

These fields are binary - they are set to one of two possible values. The text of each field changes accordingly. Some of the fields are also color-coded for easier glanceability.

* **Maintained / Unmaintained:** RealmJoin will provide new versions / updates of maintained packages on a regular basis.\
  Automatic package management can be applied to keep the software delivered by these packages permanently up-to-date in your environment.
* **Generic / Custom:** Generic packages are available to all customers / environments. Custom packages are not globally available to all customers. In most cases this is a custom software package created specifically for your environment.
* **Billable / Non-Billable:** Provisioning of this package will count towards your package usage quota - if you have one. Currently all publicly available packages are billable.
* **Free to Use / Needs License:** Does this software need a commercial license to be used?

### MS Security Center Software Inventory (TVM) entry

If available, a link to this software title's [MS Security Center Software Inventory (TVM)](https://security.microsoft.com/software-inventory/applications)'s entry will be displayed. There you can check for known security issues and outdated versions of this software in your organization.

![An Application's TVM Entry](<../../../../.gitbook/assets/image (104).png>)

An appropriate license from Microsoft is needed to access TVM.

This page allows to examine your current security posture, incl. installed versions and distribution on devices as well as security recommendations regarding this software title.

### Version

![Available Version vs Provisioned Package](<../../../../.gitbook/assets/image (250).png>)

Also displayed on the left side of the screen is the version of the software package.

If you already provisioned the package to your environment, a link to the provisioned package in [Package Management](../package-management.md) will be displayed. The link will show the name and version of the provisioned package.

## Tabs

The right side of the screen shows the contents of the current tab.

The following tabs are available:

### Overview / Subscribe

<figure><img src="../../../../.gitbook/assets/image (333).png" alt=""><figcaption><p>Overview and Provisioning</p></figcaption></figure>

#### Title, Description and other info

This tab will show the long description, license and technical help information of a package.

#### Subscribe / Provisioning

This tab also shows the Subscribe-Buttons for this package. See [Subscribe to Package](../package-deployment/).

### Changelog

The package's changelog shows when the packages has been updated in RealmJoin's repository plus a short description of changes.

<figure><img src="../../../../.gitbook/assets/image (334).png" alt=""><figcaption><p>App Package Changelog</p></figcaption></figure>

### RealmJoin Store

Raw JSON representation of the package and its metadata object in the store. This is primarily for debugging and administrative purposes.
