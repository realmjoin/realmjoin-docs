---
type: Application Management
description: >-
  RealmJoin's catalogue of ready-to-use Windows and macOS application packages
  deployable via RealmJoin Client or Microsoft Intune, and the concepts behind
  subscribing, assigning and updating them.
---

# Packages

RealmJoin Packages are ready‑to‑use software packages provided through the RealmJoin Portal, offering a large, continuously maintained catalogue of Windows and macOS applications that can be easily deployed via the **RealmJoin Client** or **Microsoft Intune**. Android apps from Managed Google Play can be managed in the same place.

This page explains the terms used throughout this section. The pages below follow the lifecycle of a package: find it in the store, subscribe to it, assign it, and keep it up to date.

## Package lifecycle

<table data-view="cards"><thead><tr><th></th><th></th><th data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td><strong>1. Find</strong></td><td>Browse and search the Package Store.</td><td><a href="package-store/">package-store</a></td></tr><tr><td><strong>2. Subscribe</strong></td><td>Add a package to your tenant for RealmJoin or Intune deployment.</td><td><a href="package-store/package-store-details.md">package-store-details.md</a></td></tr><tr><td><strong>3. Assign</strong></td><td>Assign the package to users and devices through managed groups.</td><td><a href="package-deployment.md">package-deployment.md</a></td></tr><tr><td><strong>4. Update</strong></td><td>Roll out new versions manually or automatically, with a preview stage.</td><td><a href="package-updates.md">package-updates.md</a></td></tr></tbody></table>

## Key concepts

### Package kinds

Every package in the [Package Store](package-store/) belongs to one of these kinds:

* **Generic** - Built without any customer-specific configuration and available to all customers. Settings such as arguments are configured after subscribing.
* **Custom** - Built specifically for your organization, for example from a vendor-customized installer or an in-house application. Only your tenant sees it. Custom packages are created through a [packaging request](packaging-requests/) and are an add-on.
* **Organic** - Built automatically from a `.zip` file you upload, without involvement of the Packaging Factory. Only your tenant sees it. See [Organic Packages](packaging-requests/organic-packages.md).

Independent of the kind, packages exist for **Windows** and **macOS**. Android apps are not part of the RealmJoin catalogue; they are added from [Managed Google Play](android-apps-managed-google-play.md).

### Maintained and unmaintained packages

**Maintained** packages are updated by the RealmJoin Packaging Factory whenever the vendor releases a new version, so you can keep them up to date [automatically](package-updates.md#automation). For **unmaintained** packages, you request updates yourself. See [Packaging Roles & Responsibilities](packaging-requests/packaging-roles-and-responsibilities.md).

### Deployment method

You choose per package whether it is delivered by the **RealmJoin Agent** (recommended) or pushed to **Intune** as an `intunewin` app. See [Deployment Methods: RealmJoin Agent vs. Intune](../deployment-methods.md) for how the two differ.

### Managed and basic subscriptions

* **Managed** (recommended) - RealmJoin creates and manages a fixed set of Entra ID groups for the package (Main, Preview, Available, Uninstall and optionally Update). You assign users and devices by adding them to these groups, and you can use the Preview stage and update automation.
* **Basic** (legacy) - No groups are created. You assign groups, users or devices directly. Basic subscriptions can be [converted to managed](package-deployment.md#migrating-from-basic-to-managed).

See [Package Assignments](package-deployment.md) for details.

### Package badges

The Package Store and the details page of a subscribed package show badges below the package name:

* **Generic / Custom** - The package kind, see above. Organic packages additionally show **Organic**.
* **Maintained / Unmaintained** - Whether RealmJoin provides new versions on a regular basis.
* **Billable / Not billable** - Whether provisioning this package counts towards your package usage quota, if you have one.
* **Free to use / Needs license** - Whether the software needs a commercial license to be used.

On a subscribed package, an additional badge shows the deployment method and subscription type, e.g. **RealmJoinManaged** or **IntuneBasic**.

![Package Name and Status](<../../.gitbook/assets/image (137).png>)

## Full and limited catalogue

If you recently self-onboarded into RealmJoin or do not have a subscription/licensing agreement yet, the Package Store is limited to a free-to-use subset of packages. Please [contact us](../../legal/support.md) to enable the full catalogue for your organization.
