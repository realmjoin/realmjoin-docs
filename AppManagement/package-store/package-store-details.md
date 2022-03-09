# Package Store Details

![Package Details Page](<../../.gitbook/assets/image (11) (1) (1) (1) (1).png>)

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

![](<../../.gitbook/assets/image (5) (1) (1).png>)

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

If available, a link to this software title's [MS Security Center Software Inventory (TVM)](https://security.microsoft.com/software-inventory/applications)'s entry will be displayed. There you can check for known security issues and outdated versions of this software in your organization.

![An Application's TVM Entry](<../../.gitbook/assets/image (6) (1).png>)

An appropriate license from Microsoft is needed to access TVM.

This page allows to examine your current security posture, incl. installed versions and distribution on devices as well as security recommendations regarding this software title.

### Version

![Available Version vs Provisioned Package](<../../.gitbook/assets/image (7) (1) (1) (1).png>)

Also displayed on the left side of the screen is the version of the software package.&#x20;

If you already provisioned the package to your environment, a link to the provisioned package in [Package Management](../package-management/) will be displayed. The link will show the name and version of the provisioned package.

## Subscribe to Package

On the Overview Tab of a package, you will find buttons, that allow you to import the package from the store into your environment.&#x20;

![Subscribe Buttons](<../../.gitbook/assets/image (16) (1) (1) (1).png>)

They will create a Win32 software package in Intune when pressed. You have two options:

### Managed

When you choose "managed", RealmJoin will also create AzureAD groups to assign the application to users.

![Application Groups](<../../.gitbook/assets/image (10) (1) (1) (1) (1) (1) (1) (1).png>)

Assigning users to the main and the preview group will triggered a "required" installation of this software title in Intune. Managed packages currently do not support "available" installations. This is to make sure, that future package/application updates will actually arrive on a user's device - which is not guaranteed via "available" installations.&#x20;

"Managed" packages are the prefered way to deploy software to your users. You can combine it with automated package updates and ensure your users receive latest features and patches.&#x20;

### Basic

"Basic" just creates the Intune application, but will not associate it with any groups or users. You will have to manually assign groups, devices or users.&#x20;

If you want to offer software for "available" installation through MS Company Portal you can do so with "basic" packages. Be aware, fully automated updates of software is not guaranteed via "available" installations.

## Tabs

The right side of the screen shows the contents of the current tab.&#x20;

The following tabs are available:

### Overview / Subscribe

![Overview and Provisioning](<../../.gitbook/assets/image (10) (1) (1) (1) (1) (1) (1) (1) (1).png>)

#### Ttitle, Description and other Info

This tab will show the long description, license and technical help information of a package.&#x20;

#### Subscribe / Provisioning

This tab also shows the Subscribe-Buttons for this package. See Subscribing.

### Changelog

The package's changelog shows when the packages has been updated in RealmJoin's repository plus a short description of changes.

![Appstore Package Changelog](<../../.gitbook/assets/image (12) (1) (1) (1) (1).png>)

### RealmJoin Store

Raw JSON representation of the package  and its metadata object in the store. This is primarily for debugging and administrative purposes.
