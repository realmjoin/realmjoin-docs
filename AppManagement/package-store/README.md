# Package Store

![Package Store Page](<../../.gitbook/assets/image (4) (1) (2).png>)

RealmJoin Portal has access to a large library of ready-to-use packages for Microsoft Endpoint Manager (Intune) maintend by glueckkanja-gab AG (GKGAB).

This page will list all packages available to your organization.

### Categories

Packages are sorted into categories to simplify searching/exploring the catalogue. The categories are displayed as tags on the package. Example categories are **Tools**, **Office**, **Driver**

### Search

You can use the searchbar at the top to search for a package by:

* **Display name** - e.g. "7-Zip"
* **Category** - like "Tools" or "Office"
* **Description** - like "7-Zip is a free and open-source file archiver"
* **Package ID** - e.g. "generic-7zip" (visible via [Package Details](package-store-details.md))

The search updates results instantly as you type.

### Package Types

Every package falls in at least one of the following categories. The banner on the right side of a package is color-coded accordingly.

#### Maintained Packages

GKGAB will provide new versions / updates for this package on a regular basis.

This package is available for provisioning via Intune / [Package Management](../package-management/). Automatic package management can be applied to keep the software delivered by this package permanentely up-to-date in your environment.

#### Unmaintained Package

This package is not maintained. It is available for provisioning via Intune / [Package Management](../package-management/) but will not necessarily be kept up-to-date.

#### Free Package

Packages that are based on freely available software titles. Please review and respect the individual titles licensing terms.

This package is available for provisioning via Intune / [Package Management](../package-management/).

#### Craft Package

Packages that operate outside of some standard packaging practises. For example, installations in the user's context instead of system context are done via "Craft" packages.&#x20;

In the context of RealmJoin Classic / Agent based installation - these packages to not use the "choco" engine.

Most of these packages are available for provisioning via Intune / [Package Management](../package-management/).

#### Custom Package

In contrast to the former types of packages, this kind of package is not globally available to all customers. In most cases this is a custom software package created specifically for your environment.

This package is available for provisioning via Intune / [Package Management](../package-management/).

### Full vs. Limited Catalogue of Packages

If you recently self-onboarded into RealmJoin or do not have a subscription/licensing agreement yet, the list of software packages will be limited to a free-to-use subset of packages. Please [contact us](../../support/) to enable the full catalogue of packages for your organization.
