# Package Management

![List of active packages](<../../.gitbook/assets/image (7) (1) (1) (1).png>)

The Package Management allows to show all packages that currently exist in your environment accross RealmJoin and Intune / MS Endpoint Manager.

Clicking on the name of a package will redirect you to this package's [details page](package-details.md).

## Package Types

This view can contain packages from different sources, incl.

* **Managed** and **Basic** packages from the package store, delivered via Intune
* **Unmanaged** packages in Intune (not from the package store)
* **RealmJoin Classic** "Choco" and "Craft" packages

You can use the toggles at the top of the screen to adjust which packages are displayed.

* **RJ Support only** - Limit the current view to packages from a RealmJoin source, like the package store or RealmJoin classic repositories
* **Windows only** - Exclude packages for mobile devices
* **Updates only** - Limit the view to packages from the package store where there exists a newer version of the package in the store.

## Search and Sort

The package list allows you to search for any package in your organization by any visible field, incl. name, version and platform.

The search supports realtime / as-you-type incremental search. The search results will update instantly as you type.

You can sort the current search result or the full list by any of the fields, by clicking on the fields name.

## Version and Preview

RealmJoin supports a staged update procedure for software packages.&#x20;

If a newer version of a managed package exists, you can subscribe to the new version of a package as "preview". This will create a separate instance of the package in intune with the new version and allows you to assign this package preview to a pilot user group for testing.

![](<../../.gitbook/assets/image (12) (1) (1) (1) (1).png>)

The package list shows you the version information of the main package, the preview package (if available) as well as the version number of the package currently available in the package store.

If Update Automation is activated, the desired update timeframe is displayed in the column "Automation". A value of "ASAP" means, the package is due for updating.

&#x20;
