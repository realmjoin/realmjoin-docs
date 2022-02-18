# Package Details

![Package Details Page](<../../.gitbook/assets/image (11).png>)

This page will show detailed information for a single package from the package store and allows to provision this package to your environment.

## Package Types

The RealmJoin Store contains two types of packages. **Intune** packages and **Craft** packages. Only Intune Packages can be deployed using RealmJoin Portal at this point.

Currently only Intune Win32 app packages can be provisioned using RealmJoin Portal. Other package types like Craft packages can be displayed but currently not provisioned.

Craft packages can be used in conjuction with RealmJoin Client and are not delivered via Intune/Microsoft Endpoint Manager. Please visit [RealmJoin Classic](https://realmjoin-web.azurewebsites.net/home) to assign Craft packages.&#x20;

## Package Properties

### Core properties

Every package details page will show an overview of the core properties like the package's **Display Name**, **Description** and **Package ID** ("Unique RJ ID") on the left side of the screen. This part will not scroll and be always visible in any tab.

### Status fields

Also displayed on the left side of the screen are four status fields for a package, displayed as tags below the package name and publisher name.

![](<../../.gitbook/assets/image (5).png>)

These fields are binary - they are set to one of two possible values. The text of each field changes accordingly. Some of the fields are also color-coded for easier glancability.

#### Maintained / Unmaintained

GKGAB will provide new versions / updates of maintained packages on a regular basis.&#x20;

Automatic package management can be applied to keep the software delivered by these packages permanentely up-to-date in your environment.

#### Generic / Custom

"Generic" packages are available to all customers / environments.&#x20;

"Custom" packages are not globally available to all customers. In most cases this is a custom software package created specifically for your environment.

#### Billable / Non-billable

Provisioning of this package will count towards your package usage quota - if you have one. Please see [Licensing](https://www.realmjoin.com/pricing/). Currently all publicly available packages are billable.

#### Free to Use / Needs license

Does this software need a commercial license to be used?

### MS Security Center Software Inventory (TVM) entry

When clicking the link next to Unique TVM ID, you are redirected to this application's entry in MS Security Center.

If available, a link to this software title's [MS Security Center Software Inventory (TVM)](https://security.microsoft.com/software-inventory/applications)'s entry will be displayed. There you can check for known security issues and outdated versions of this software in your organization.

![An Application's TVM Entry](<../../.gitbook/assets/image (6).png>)

An appropriate license from Microsoft is needed to access TVM.

This page allows to examine your current security posture, incl. installed versions and distribution on devices as well as security recommendations regarding this software title.

### Version

![Available Version vs Provisioned Package](<../../.gitbook/assets/image (7).png>)

Also displayed on the left side of the screen is the version of the software package.&#x20;

If you already provisioned the package to your environment, a link to the provisioned package in [Package Management](../package-management.md) will be displayed. The link will show the name and version of the provisioned package.

## Tabs

The right side of the screen shows the contents of the current tab.&#x20;

The following tabs are available:

### Overview / Subscribe

![Overview and Provisioning](<../../.gitbook/assets/image (10).png>)

#### Metadata

This tab will show the long description, license and technical help information of a package.&#x20;

#### Subscribe / Provisioning



### Changelog

### RealmJoin Store

Raw JSON representation of the package object.&#x20;
