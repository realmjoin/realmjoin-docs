---
type: Application Management
description: >-
  RealmJoin organic packages build from uploaded .zip files and publish
  automatically to the Package Store for binary file transport.
---

# Organic Packages

Organic packages are used for binary file transportation with a fixed configuration, which can not be changed. Uploaded .zip files are automatically added to the list of available packages in the tenant, and secured with a strong password. The content will be extracted to _`$env:SystemDrive\Install\packagename`_ during package execution. This path can not be changed. An optional antivirus scan is available.

Because of this high standardization, organic packages are built automatically and within a couple of minutes. No ticket will be created and no charge added, the package will be made available in the Package Store under the Organic filter as soon as possible without the need of involvement of the packaging factory.

## Request an organic package

On the **New Packaging Request** tab of _Request Package_, select **New Organic Package**. This requires the `CanRequestSoftwareOrganic` [permission](../../../administration-and-settings/permission/custom-roles/available-permissions.md#software-requests).

<figure><img src="../../../.gitbook/assets/image (322).png" alt=""><figcaption><p>Organic packaging request.</p></figcaption></figure>

* **Package Name** and **Vendor** - Together up to 60 characters.
* **Description** - Required.
* **Comment** - Optional, shown in the Portal.
* **Request Antivirus Scan** - Optional. By selecting it, you agree that your uploaded files are shared with our antivirus partner for scanning.

Then upload the `.zip` file. The package appears under the **Organic** filter of the [Package Store](../package-store/) once it is built.

{% hint style="warning" %}
Due to their automated creation process, organic packages cannot be updated. These packages are generated and published without user input, making them unchangeable. Additionally, since no installation routine is run, logical updates are not possible. To release a new version, create a new automatic organic package and remove the outdated one from your portal.
{% endhint %}

## Unlist organic packages

To keep an outdated organic package from being subscribed again, unlist it in the Package Store with **Unlist now**. See [Listing and unlisting packages](../package-store/#listing-and-unlisting-packages).
