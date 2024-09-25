# Package Details

![Package Details Page](<../../../.gitbook/assets/image (61).png>)

This page will show detailed information for a single package in your environment and allows you to manage its assignment to users and updates.

This page looks like the [Package Store Details](package-store/package-store-details.md) page but gives details about a package that is already imported into your environment. It does not reflect the generic package store entry.

## Package Types

This page can display any package that is understood by RealmJoin Portal, this includes

* **Managed** and **Basic** packages from the package store, delivered via Intune
* **Unmanaged** packages in Intune (not from the package store)
* **RealmJoin Classic** "Choco" and "Craft" packages

Different types of packages have different levels of support to be managed via RealmJoin Portal at this point. This guide will focus on **Managed** and **Basic** packages from the package store as these are best supported currently.

## Package Properties

### Name and Core properties

Every package detail page will show an overview of the core properties like the package's **Display Name**, **Description** and **Package ID** ("Unique RJ ID") on the left side of the screen. This part will not scroll and be always visible in any tab.

You can use the Edit-Button next to the package's name to give a package a custom display name relevant to your users. For packages hosted in Intune, this will also rename the package's display name in Intune. This will not break the relationship with the [package store entry](package-store/package-store-details.md) for packages sourced from the [package store](package-store/).

![Package Name and Status](<../../../.gitbook/assets/image (106).png>)

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

![An Application's TVM Entry](<../../../.gitbook/assets/image (104).png>)

### Version

![](<../../../.gitbook/assets/image (176).png>)

Also displayed on the left side of the screen is the version of the software package.

If a "preview" version of the package is deployed, you can see it here. Otherwise it will be shown as "N/A".

If this is a package sourced from the [package store](package-store/), a link to the [packages store details page](package-store/package-store-details.md) will be given.



## Deployment Status

You can also review the installation status of given assignments / this package on users and clients.

## Tabs

The right side of the screen shows the contents of the current tab.

The following tabs are available:

### Overview

![Overview Tab](<../../../.gitbook/assets/image (160).png>)

#### Title, Description and other Info

This tab will show the long description, license and technical help information of a package.

### Changelog

The package's changelog shows when the packages has been updated in RealmJoin's repository or Intune plus a short description of changes.

![Package Changelog](<../../../.gitbook/assets/image (116).png>)

There are two types of changes tracked in Changelog.

![](<../../../.gitbook/assets/image (229).png>) Changes to the instance of the package in your environment, specifically in Intune. E.g. publishing a newer version of the package to your users.

![](<../../../.gitbook/assets/image (198).png>) Changes to package store entry.

### Intune App and RealmJoin Store

Raw JSON representation of the package and its metadata in Intune or in the package store respectively. This is primarily intended for debugging and administrative purposes.
