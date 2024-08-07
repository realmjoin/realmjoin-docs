# Package Details

![Package Details Page](<../../.gitbook/assets/image (61).png>)

This page will show detailed information for a single package in your environment and allows you to manage its assignment to users and updates.

This page looks like the [Package Store Details](../package-store/package-store-details.md) page but gives details about a package that is already imported into your environment. It does not reflect the generic package store entry.

## Package Types

This page can display any package that is understood by RealmJoin Portal, this includes

* **Managed** and **Basic** packages from the package store, delivered via Intune
* **Unmanaged** packages in Intune (not from the package store)
* **RealmJoin Classic** "Choco" and "Craft" packages

Different types of packages have different levels of support to be managed via RealmJoin Portal at this point. This guide will focus on **Managed** and **Basic** packages from the package store as these are best supported currently.

## Package Properties

### Name and Core properties

Every package detail page will show an overview of the core properties like the package's **Display Name**, **Description** and **Package ID** ("Unique RJ ID") on the left side of the screen. This part will not scroll and be always visible in any tab.

You can use the Edit-Button next to the package's name to give a package a custom display name relevant to your users. For packages hosted in Intune, this will also rename the package's display name in Intune. This will not break the relationship with the [package store entry](../package-store/package-store-details.md) for packages sourced from the [package store](../package-store/).

![Package Name and Status](<../../.gitbook/assets/image (106).png>)

### Status Fields

Also displayed on the left side of the screen are four status fields for a package, displayed as tags below the package name and publisher name.

These fields are binary - they are set to one of two possible values. The text of each field changes accordingly. Some of the fields are also color-coded for easier glanceability.

#### Maintained / Unmaintained

RealmJoin will provide new versions / updates of maintained packages on a regular basis.

Automatic package management can be applied to keep the software delivered by these packages permanently up-to-date in your environment.

#### Generic / Custom

"Generic" packages are available to all customers / environments.

"Custom" packages are not globally available to all customers. In most cases this is a custom software package created specifically for your environment.

#### Billable / Non-billable

Provisioning of this package will count towards your package usage quota - if you have one. Currently all publicly available packages are billable.

#### Intunemanaged / Intuneunmanaged

These tags denote packages, that are offered via Intune.

* **Intunemanaged**: Managed and Basic packages from the package store, delivered via Intune
* **Intuneunmanaged**: Unmanaged packages in Intune (not from the package store)

#### Free to Use / Needs license

Does this software need a commercial license to be used?

### MS Security Center Software Inventory (TVM) entry

If available, a link to this software title's [MS Security Center Software Inventory (TVM)](https://security.microsoft.com/software-inventory/applications)'s entry will be displayed. There you can check for known security issues and outdated versions of this software in your organization.

![An Application's TVM Entry](<../../.gitbook/assets/image (104).png>)

### Version

![](<../../.gitbook/assets/image (176).png>)

Also displayed on the left side of the screen is the version of the software package.

If a "preview" version of the package is deployed, you can see it here. Otherwise it will be shown as "N/A".

If this is a package sourced from the [package store](../package-store/), a link to the [packages store details page](../package-store/package-store-details.md) will be given.

## Assignments

In the [Overview tab](package-details.md#overview-assignment), you can manage assignments of this package/application to users.

![Package Assignments](<../../.gitbook/assets/image (56).png>)

### Assignment Settings

For RealmJoin Client Packages, individual assignments can carry settings, modifying the packages deployment behavior.

<figure><img src="../../.gitbook/assets/image (254).png" alt=""><figcaption><p>Assignment Settings Option</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (244).png" alt=""><figcaption><p>Assignment Settings</p></figcaption></figure>

### Groups

For supported application types, especially **managed packages**, you will see the package's Entra ID groups which can be used to assign applications to users or to trigger an uninstallation.

You can click the group name to enter the group's details and add/remove users to the group.

## Update Groups

RealmJoin allows to automatically "onboard" loose installations of a software title into management.&#x20;

Click **Enable Update Group** and a new EntraID Group with the suffix "(update)" will be created and software installations also assigned to this group.&#x20;

RealmJoin will dynamically discover installed copies of the software that are unmanaged and add the device it has been discovered on to the update group.

<figure><img src="../../.gitbook/assets/image (123).png" alt=""><figcaption><p>Enable an Update Group</p></figcaption></figure>

Thus, new version of this software will also be installed on these devices to assert deployment of security patches across your environment.

<figure><img src="../../.gitbook/assets/image (189).png" alt=""><figcaption><p>Enabled Update Group</p></figcaption></figure>

## Deployment Status

You can also review the installation status of given assignments / this package on users and clients.

## Tabs

The right side of the screen shows the contents of the current tab.

The following tabs are available:

### Overview

![Overview Tab](<../../.gitbook/assets/image (160).png>)

#### Title, Description and other Info

This tab will show the long description, license and technical help information of a package.

### Changelog

The package's changelog shows when the packages has been updated in RealmJoin's repository or Intune plus a short description of changes.

![Package Changelog](<../../.gitbook/assets/image (116).png>)

There are two types of changes tracked in Changelog.

![](<../../.gitbook/assets/image (229).png>) Changes to the instance of the package in your environment, specifically in Intune. E.g. publishing a newer version of the package to your users.

![](<../../.gitbook/assets/image (198).png>) Changes to package store entry.

### Automation

<figure><img src="../../.gitbook/assets/image (219).png" alt=""><figcaption><p>Package Automation</p></figcaption></figure>

For managed packages, you can use the Automation tab to configure automatic publishing of new version of packages from the package store to your environment.

* **Automate Main Channel** - Automatically deploy new versions of this package to your users. ("Main" subscription)
* **Automate Preview Channel** - Automatically deploy new versions of this package to your pilot users. ("Preview" subscription)

{% hint style="info" %}
The Preview Channel will only advance to a newer software version after deploying the current version in Preview to the Main Channel.&#x20;

This is intended behavior to ensure that a testing / review process using the Preview Channel is not accidentally invalidated by a newer software version entering Preview.
{% endhint %}

The Preview Channel will take the newest version available from the App Store pushing its current version to the main channel.

{% hint style="success" %}
Recommendation:&#x20;

* Automate only **Main Channel** for software that can upgrade without prior testing, like web browsers from major vendors.
* Automate only **Preview Channel** for software you want to test before deploying. Push the validated version to Main Channel after testing and start testing the next version in Preview.

You can always manually push a newer version available in Package Store directly to **Preview** or **Main Channel** to skip a version you don't want published.
{% endhint %}

* **... defer X days** - Wait for this number of days to pass before publishing a new version to the channel. This is useful to avoid stress for users/clients if multiple package versions are published rapidly.
* **Deploy At Night** - Schedule automatic deployment during nighttime
* **Select target timezone** - If you use AutoDeployAtNight, use this Time Zone to indicate when "at night" is.

These values can be globally preconfigured for newly imported packages in [Settings](../../realmjoin-settings/settings.md). Configuring them on a per package basis will overwrite the global defaults.

#### Interactions between Main and Preview Channel



### Config

<figure><img src="../../.gitbook/assets/image (315).png" alt=""><figcaption><p>Package Config</p></figcaption></figure>

You can assign multiple **Technical Application Owners** (TAO) to a package by storing their email-address to reach out. This is optional and currently is purely for information/administrative purposes.&#x20;

You need to **enable** the switch below TAOs to subscribe to changes/updates.&#x20;

**Arguments** allow you to pass command line switches to an application installation. This is commonly used to define language options or license key that need to be present at installation time.

Some packages include **Technical Help**, to explain possible **Arguments** and other Requirements.

![Technical Help for a Package](<../../.gitbook/assets/image (47).png>)

### Expert Settings

RealmJoin Client packages allow **Expert Settings** which modify an app's deployment behavior. These can be reached via the **Config** tab.

<figure><img src="../../.gitbook/assets/image (165).png" alt=""><figcaption><p>Expert Settings</p></figcaption></figure>

### Intune App and RealmJoin Store

Raw JSON representation of the package and its metadata in Intune or in the package store respectively. This is primarily intended for debugging and administrative purposes.
