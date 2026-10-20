---
type: Application Management
description: >-
  The RealmJoin Package Store is a maintained library of ready-to-use packages
  deployable via RealmJoin Client or Intune. Browse, filter and inspect packages
  before subscribing.
---

# Package Store

{% embed url="https://www.youtube.com/watch?v=QYBx9yto560" %}

<figure><img src="../../../.gitbook/assets/image (16).png" alt=""><figcaption><p>The RealmJoin Package Store</p></figcaption></figure>

RealmJoin Portal provides and maintains a large library of ready-to-use packages, easily deployable using either the RealmJoin Client or Intune. The store also holds the custom and organic packages built for your organization.

## Browse the store

### Filters

Two filter groups narrow down the list. Each shows one option at a time.

<figure><img src="../../../.gitbook/assets/image (384).png" alt=""><figcaption><p>Package type filter</p></figcaption></figure>

**Package type** (see [Package kinds](../#package-kinds)):

* **Generic** (default) - Packages available to all customers.
* **Custom** - Packages built specifically for your organization.
* **Organic** - Packages built automatically from your uploaded `.zip` files.
* **Unlisted** - Only shown to tenant administrators. Lists your custom and organic packages that are not listed in the store, see [Listing and unlisting packages](./#listing-and-unlisting-packages).

**Operating system:**

* **Windows** (default)
* **MacOS** - macOS packages can only be deployed via Intune.
* **Android** - Only shown if Android app deployment is activated for your tenant. Android apps are not part of the RealmJoin catalogue; they are added from Managed Google Play by pasting a Google Play link. See [Android Apps (Managed Google Play)](../android-apps-managed-google-play.md).

### Search

The search bar above the list searches by:

* **Display name** - e.g. "7-Zip"
* **Category** - e.g. "Tools" or "Office". Categories are shown as tags on each package.
* **Description** - e.g. "free and open-source file archiver"
* **Package ID** - e.g. "generic-7zip". The ID is matched from its start.
* **Unique TVM ID** - The software's ID in the Microsoft Defender software inventory, matched from its start.

The results update as you type. The placeholder shows how many packages your tenant can access; on a [limited catalogue](../#full-and-limited-catalogue) it shows the number of free packages next to the total.

## Package Store details

<figure><img src="../../../.gitbook/assets/image (21).png" alt=""><figcaption><p>Package Store details page</p></figcaption></figure>

Clicking a package opens its store entry. The store entry describes the package as RealmJoin provides it. Once you subscribe, your tenant's instance has its own [details page](../package-details.md).

### Package properties

The left side of the page always shows the core properties of the package:

* **Display name**, **publisher** and **description**
* The [package badges](../#package-badges), such as _Generic_ and _Maintained_
* **Package ID** ("Unique RJ ID"), e.g. `generic-7zip`
* **Platform**, **package type** (e.g. Choco or Craft for Windows, PKG or DMG for macOS) and **architectures**
* **Download size** and **install size**
* **Version**, **last update** and the update comment
* **Unique TVM ID** - If available, a link to the software's entry in the [Microsoft Defender software inventory (TVM)](https://security.microsoft.com/software-inventory/applications). There you can check for known security issues and outdated versions of this software in your organization. An appropriate license from Microsoft is needed to access TVM.
* **In RealmJoin as** / **In Intune as** - If you already subscribed to the package, a link to your subscription in [Package Management](../package-management.md).

![Available Version vs Provisioned Package](<../../../.gitbook/assets/image (267).png>)

### Overview tab

<figure><img src="../../../.gitbook/assets/image (343).png" alt=""><figcaption><p>Overview tab</p></figcaption></figure>

The Overview tab is split into these sections:

* **Readme** - The long description of the package.
* **Subscribe** - The buttons to subscribe to the package, see [Subscribing to a Package](package-store-details.md).
* **Technical Help** - If the package provides it, the supported [arguments](../package-settings.md#arguments) and other requirements.

### Versions tab

The Versions tab is the package's changelog. It shows when the package has been updated in RealmJoin's repository plus a short description of changes.

Each version in the changelog links to its own Package Store entry. Subscribing from such an entry provisions exactly that version, which is the only way to deploy a version older than the current one. An already subscribed package cannot be downgraded, see [Package Updates](../package-updates.md#downgrades).

<figure><img src="../../../.gitbook/assets/image (344).png" alt=""><figcaption><p>Package changelog</p></figcaption></figure>

## Listing and unlisting packages

Custom and organic packages can be unlisted, for example to keep an outdated organic package from being subscribed again. At the bottom of the left side, the store entry shows whether it is **Listed in Store** or **Not listed in Store**. Tenant administrators can switch this with **Unlist now** or **List now**.

<figure><img src="../../../.gitbook/assets/image (392).png" alt=""><figcaption><p>Unlist now</p></figcaption></figure>

Unlisted packages no longer appear under _Custom_ or _Organic_. Tenant administrators still find them under the **Unlisted** filter and can list them again.
