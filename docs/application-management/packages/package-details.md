---
type: Application Management
description: >-
  The RealmJoin package details page shows a single package's properties and
  manages its user assignments and updates.
---

# Package Details

<figure><img src="../../.gitbook/assets/image (20).png" alt=""><figcaption><p>Package details page</p></figcaption></figure>

This page will show detailed information for a single package in your environment and allows you to manage its assignment to users and updates.

This page looks like the [Package Store Details](package-store/package-store-details.md) page but gives details about a package that is already imported into your environment. It does not reflect the generic package store entry.

## Package Types

This page can display any package that is understood by RealmJoin Portal, this includes

* **Managed** and **Basic** packages from the package store
* **Unmanaged** packages in Intune (not from the package store)
* **RealmJoin Classic** "Choco" and "Craft" packages

Different types of packages have different levels of support to be managed via RealmJoin Portal at this point. This guide will focus on **Managed** and **Basic** packages from the package store as these are best supported currently.

## Package Properties

### Name and Core properties

Every package detail page will show an overview of the core properties like the package's **Display Name**, **Description** and **Package ID** ("Unique RJ ID") on the left side of the screen. This part will not scroll and be always visible in any tab.

You can use the edit button next to the package's name to give a package a custom display name relevant to your users. For packages hosted in Intune, this will also rename the package's display name in Intune. This will not break the relationship with the [package store entry](package-store/package-store-details.md) for packages sourced from the [package store](package-store/).

![Package Name and Status](<../../.gitbook/assets/image (131).png>)

### Status Fields

Also displayed on the left side of the screen are four status fields for a package, displayed as tags below the package name and publisher name.

These fields are binary - they are set to one of two possible values. The text of each field changes accordingly. Some of the fields are also color-coded for easier glanceability.

* **Maintained / Unmaintained:** RealmJoin will provide new versions / updates of maintained packages on a regular basis.\
  Automatic package management can be applied to keep the software delivered by these packages permanently up-to-date in your environment.
* **Generic / Custom:** Generic packages are available to all customers / environments. Custom packages are not globally available to all customers. In most cases this is a custom software package created specifically for your environment.
* **Billable / Non-Billable:** Provisioning of this package will count towards your package usage quota - if you have one. Currently all publicly available packages are billable.
* **Free to Use / Needs License:** Does this software need a commercial license to be used?
* **Intunemanaged / Intuneunmanaged:** These tags denote packages, that are offered via Intune.
  * **Intunemanaged**: Managed and Basic packages from the package store, delivered via Intune
  * **Intuneunmanaged**: Unmanaged packages in Intune (not from the package store)

## Tabs

The right side of the screen shows the contents of the current tab.

The following tabs are available:

### Overview

<figure><img src="../../.gitbook/assets/image (18).png" alt=""><figcaption><p>Overview tab</p></figcaption></figure>

#### Title, Description and other Info

This tab will show the long description, license and technical help information of a package.

#### Update

If the Package Store offers a newer version than the one deployed in your environment, the _Update_ section shows the available actions. For managed packages these are _Apply latest update to main_, _Start latest update with preview_, _Apply preview to main_ and _Apply update to preview_; Basic packages only offer _Apply update_. See [Version and Preview](package-management.md#version-and-preview) for the staged update procedure.

**Choose another version**

By default, an update always targets the latest version in the Package Store. If you want to skip a version or need a specific one, click _Choose another version_ below the update buttons. A dropdown lists the eligible versions, the latest one marked with "(latest)"; select one and confirm with _Update_. For managed packages there is one row per target: _Main_, _Preview_ (start a preview) and _Update preview_ (move an existing preview).

The option is only shown when all of the following apply:

* The package was subscribed from the Package Store and an update is available (the _Update_ section is visible).
* No update or other operation is currently running for this package.
* The Package Store holds at least **two** versions newer than the version currently deployed in that slot (Main or Preview). With only one newer version, the regular update button already targets it.
* For _Main_: **Automate Main Channel** is off. For _Preview_: **Automate Preview Channel** is off (see [Automation](package-settings.md#automation)). Updating an already running preview is not affected by automation.
* You hold the `CanSubscribeApp` and `CanUpgradeApp` [permissions](../../administration-and-settings/permission/custom-roles/available-permissions.md).
* For _Main_, at least one Main group must be assigned; for _Preview_, the preview group must exist.

{% hint style="warning" %}
**Downgrades are not possible.** The dropdown only lists versions newer than the one currently deployed, and the backend rejects any update that targets an older version. To deploy an older version, open that version's entry in the Package Store — the [Versions tab](package-store/package-store-details.md#versions) links every changelog row to its store entry — and subscribe from there. Since each package ID can only be subscribed once, this requires removing the existing subscription first.

Independent of the assigned version, the RealmJoin Agent will not replace a newer version that is already installed on a device unless the client policy [Allow downgrade of packages](../../ugd-management/user-and-group-settings/additional-settings.md#softwarepackaging.autoupgradecandowngrade) is set. As with any version change, existing installations only follow the new version if [Auto upgrade](package-settings.md#expert-settings) is enabled for the package.
{% endhint %}

#### Assignments and Deployment Status

Use these tables to assign additional groups and check the deployment status of apps for devices and/or users. If a device and its user end up in conflicting groups of the same package, see [Assignment priority and conflicts](package-deployment.md#assignment-priority-and-conflicts) for how this is resolved.<br>

<figure><img src="../../.gitbook/assets/image (365).png" alt=""><figcaption></figcaption></figure>

#### Usage

{% hint style="warning" %}
The Usage function requires the RealmJoin Agent to properly populate data.
{% endhint %}

Use the usage table to determine the spread of versions deployed across your device fleet as well as your license count. Clicking on the numbers under Client Count or User Count will show the device/users using the respective version of the package.

<figure><img src="../../.gitbook/assets/image (366).png" alt=""><figcaption></figcaption></figure>

### History

The package's history shows when the package has been updated in RealmJoin's repository.

<figure><img src="../../.gitbook/assets/image (19).png" alt=""><figcaption><p>History tab</p></figcaption></figure>

There are two types of changes tracked in Changelog.

![](<../../.gitbook/assets/image (247).png>) Changes to the instance of the package in your environment, specifically in Intune. E.g. publishing a newer version of the package to your users.

![](<../../.gitbook/assets/image (218).png>) Changes to package store entry.
