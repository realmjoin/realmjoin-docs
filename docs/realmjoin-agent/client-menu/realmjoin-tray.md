---
type: RealmJoin Agent
description: >-
  The RealmJoin Tray menu provides customizable web links and installs or
  updates software packages from the device.
---

# RealmJoin Tray

## Client Menu

After being successfully installed, RealmJoin is automatically started upon user login and is permanently active in the background. It is represented with an ID card icon.

<figure><img src="../../.gitbook/assets/image (316).png" alt=""><figcaption></figcaption></figure>

Clicking on the icon opens the RealmJoin client menu. It contains basic information in the lower part and several links in the upper part. These links are ordered in two different sections - **Web Links** and **Software Packages**.

![](<../../.gitbook/assets/image (92).png>)

**Web Links** contains customizable web links. For example, Google. When a user clicks the web link **Google**, RealmJoin opens Google Search automatically.

Software Packages contain customizable software categories. For example, **Browser** contains links to Mozilla Firefox or Google Chrome. With a click on a link, RealmJoin automatically starts an installation or an updating process (if the software is already installed).

Furthermore, RealmJoin offers a remote function (**Start remote session**). For more information read our [AnyDesk article](../realmjoin-client/anydesk-integration/).

A further useful feature is **Sync this device:**

![](<../../.gitbook/assets/image (106).png>)

When you click **Sync this device** RealmJoin will install or update mandatory packages. Furthermore, **Sync this device** helps to speed up background processes (e. g. waiting for new weblinks or waiting for an admin account).

## App Catalog Entry

The tray menu can also show an **App Catalog** entry that opens the device's [App Catalog](self-service-portal.md#app-catalog-tab) directly. This entry is enabled and customized via the [`AppCatalog`](https://docs.realmjoin.com/ugd-management/user-and-group-settings/additional-settings#appcatalog-feature) client setting:

* Enable it with `AppCatalog.Enabled`.
* Rename the entry with [`AppCatalog.Ui.DisplayName`](https://docs.realmjoin.com/ugd-management/user-and-group-settings/additional-settings#appcatalog-feature) (defaults to `"App Catalog"`).

See [One-Click Access: Self-Service Portal from the Tray](self-service-portal.md#one-click-access-self-service-portal-from-the-tray) for details.
