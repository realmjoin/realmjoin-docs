# Package Management

Package Management allows to show all packages that currently exist in your environment across RealmJoin and Microsoft Intune.

<figure><img src="../../.gitbook/assets/image (8) (3).png" alt=""><figcaption><p>Package Management List</p></figcaption></figure>

Clicking on the name of a package will redirect you to the package's [details page](package-details.md).

## Filters

This view can contain packages from different sources, incl.

* **All** - Show all packages accros RealmJoin and Intune, incl. mobile packages and Windows Store packages
* **Supported** - Show only packages handled by RealmJoin (RealmJoin Client + Intune)&#x20;
* **RealmJoin** - Show only RealmJoin packages deployed via RealmJoin Client
* **Intune** - Show only RealmJoin packages deployed via Microsoft Intune

Also

* **Updates only** - Limit the view to packages from the package store where there exists a newer version of the package in the store.
* **Automation only** - Limit the view to packages from the package store where automatic deployment of newer versions is configured.

## Search and Sort

The package list allows you to search for any package in your organization by any visible field, incl. name, version and platform.

The search supports realtime / as-you-type incremental search. The search results will update instantly as you type.

You can sort the current search result or the full list by any of the fields, by clicking on the fields name.

## Version and Preview

RealmJoin supports a staged update procedure for software packages.&#x20;

If a newer version of a managed package exists, you can subscribe to the new version of a package as **Preview**. This will create a separate instance of the package with the new version and allows you to assign this package preview to a pilot user group for testing.

<figure><img src="../../.gitbook/assets/image (3) (6).png" alt=""><figcaption><p>List of Updates</p></figcaption></figure>

The package list shows you the version information of the main package, the preview package (if available) as well as the version number of the package currently available in the package store.

If Update Automation is activated, the desired update timeframe is displayed in the column **Automation**. A value of "ASAP" means, the package is due for updating.

&#x20;
