# Package Store



{% embed url="https://www.youtube.com/watch?v=QYBx9yto560" %}

<figure><img src="../../../.gitbook/assets/image (1).png" alt=""><figcaption><p>The RealmJoin application store</p></figcaption></figure>

RealmJoin Portal provides and maintains a large library of ready-to-use packages, easily deployable using either the RealmJoin Client or Intune.

### Categories

Packages are sorted into categories to simplify searching. The categories are displayed as tags on the package. Example categories are **Tools**, **Office**, **Driver**

### Search

You can use the search bar at the top to search for a package by:

* **Display name** - e.g. "7-Zip"
* **Category** - like "Tools" or "Office"
* **Description** - like "7-Zip is a free and open-source file archiver"
* **Package ID** - e.g. "generic-7zip" (visible via [Package Details](package-store-details.md))

The search updates results instantly as you type.

### Package Types

Every package falls in at least one of the following categories. The banner on the right side of a package is color-coded accordingly.

<figure><img src="../../../.gitbook/assets/image (36).png" alt=""><figcaption><p>Package type filter</p></figcaption></figure>

#### Generic Packages

If an application package is created without any customer-specific configuration hard-coded inside, it is created as generic package. Generic packages are available to all customers the same, and if possible, generic packages will be created as maintained packages.&#x20;

This package is available for provisioning via RealmJoin Agent & Intune / [Package Management](../package-management.md).

#### Custom Package

In contrast to the former types of packages, this kind of package is not globally available to all customers. In most cases this is a custom software package created specifically for your environment.

This package is available for provisioning via RealmJoin Agent & Intune / [Package Management](../package-management.md).

#### Organic Package

In contrast to the former types of packages, this kind of package is not globally available to all customers. In most cases this is a custom software package created specifically for your environment.

This package is available for provisioning via RealmJoin Agent & Intune / [Package Management](../package-management.md).

#### macOS Packages

Filter on OS type. Default filter is _Windows_, to access macOS packages, select _macOS_. This filter works in conjunction with the _generic/custom/organic/unlisted_ filter.

macOS packages are only available for provisioning via Intune.

#### Unlisted Package

This section is only available for selected ADM accounts. If you can see it, you know what it is.

### Full vs. Limited Catalogue of Packages

If you recently self-onboarded into RealmJoin or do not have a subscription/licensing agreement yet, the list of software packages will be limited to a free-to-use subset of packages. Please [contact us](../../../legal/support.md) to enable the full catalogue of packages for your organization.
