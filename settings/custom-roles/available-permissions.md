# Available Permissions

## Overview

This page will try to list and explain available permissions to use in Custom Roles.

{% hint style="info" %}
This list is not complete, as the feature-set of RealmJoin is continually growing.&#x20;

Please use [Auto-Complete](./#auto-complete) in Custom Roles' editor to see all currently available permissions.
{% endhint %}

We will expand this list over time.

As there are many permissions available, we will group them by topic for easier naviagtion.

## Navigation

### CanReadSettingsDetails

The user gains access to to [Settings](../)

## App Management

### CanReadAppTable

The user gains read access to [Package Management](../../AppManagement/package-management/) (Package Management List). This does not grant permission to the package details.

### CanReadIntuneAppDetails

**Given**:

* User has access [Package Management](../../AppManagement/package-management/)&#x20;

The user gains read only access to Intune packages / [package details](../../AppManagement/package-management/package-details.md).

### CanReadRealmJoinAppDetails

**Given**:

* User has access [Package Management](../../AppManagement/package-management/)&#x20;

The user gains read only access to RealmJoin Client packages / [package details](../../AppManagement/package-management/package-details.md).

### CanChangeAppAssignments

**Given**:

* User has access to [Package Details](../../AppManagement/package-management/package-details.md)

The user gains the ability to add/remove user or group assignments in a packages details. &#x20;

### CanChangeAppAssignmentSettings

**Given**:

* User has access to [Package Details](../../AppManagement/package-management/package-details.md)

On RealmJoin Client Packages, the option to change [per assignment settings](../../AppManagement/package-management/package-details.md#assignment-settings) will be shown and users can modify the settings.

### CanEditAppArgs&#x20;

**Given**:

* User has access to [Package Details](../../AppManagement/package-management/package-details.md)

The user gains the ability to modify an app's command line arguments in [Package Details](../../AppManagement/package-management/package-details.md).

### CanEditAppAutomation&#x20;

**Given**:

* User has access to [Package Details](../../AppManagement/package-management/package-details.md)

The user gains the ability to modify an [Intune app's automation](../../AppManagement/package-management/package-details.md#automation) settings ( = If and when newer versions of the package from the store will be automatically rolled out to existing users.)&#x20;

### CanEditAppDisplayName&#x20;

**Given**:

* User has access to [Package Details](../../AppManagement/package-management/package-details.md)

The user gains the ability to modify an app's display name.

### CanEditAppExpertSettings&#x20;

**Given**:

* User has access to [Package Details](../../AppManagement/package-management/package-details.md)

The user gains the ability to modify an [app's expert settings](../../AppManagement/package-management/package-details.md#expert-settings).

### CanEditAppTechnicalApplicationOwners&#x20;

**Given**:

* User has access to [Package Details](../../AppManagement/package-management/package-details.md)

The user gains the ability to modify an app's Technical App. Owners in [Config](../../AppManagement/package-management/package-details.md#config).

### CanDeleteApp

**Given**:

* User has access to [Package Details](../../AppManagement/package-management/package-details.md)

The user gains the ability to delete an app from a [Package Management](../../AppManagement/package-management/). This will not remove an app from the package store and will not trigger uninstallations on existing deployments.

## Self Service Forms

### CanAddSelfServiceForms and CanDeleteSelfServiceForms

**Given**:&#x20;

* Self Service Forms are enabled for your tenant
* User has access to [Settings](../)

The user can create new or delete Self Service Forms in [Settings->Self Service Forms](../../self-service-forms.md#settings-page) respectively.&#x20;
