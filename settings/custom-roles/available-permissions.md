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

## User Management

### CanReadUserTable&#x20;

The user gains the ability to see the [list of all AzureAD users](../../user-group-device-management/user-list/).

### CanReadUserDetails&#x20;

The user gains the ability to inspect an individual [user's details](../../user-group-device-management/user-list/user-details.md).

### CanSeeRealmJoinUserSettings&#x20;

**Given**:&#x20;

* CanReadUserDetails

Allow the user to see/inspect [RealmJoin Client Settings](../../user-group-device-management/user-and-group-settings.md) assigned to a specific user.

### CanChangeRealmJoinUserSettings

**Given**:&#x20;

* CanReadUserDetails
* CanSeeRealmJoinUserSettings

Allow the user to add/modify/delete[ RealmJoin Client Settings](../../user-group-device-management/user-and-group-settings.md) assigned to a specific user.

### CanReadUserSettingTable&#x20;

The user gains the ability to see the list of [user settings](../../user-group-device-management/user-and-group-settings.md) (across all users) from the [navigation](available-permissions.md#navigation).

### CanReadUserSettingDetails&#x20;

The user gains the ability to inspect all [user settings](../../user-group-device-management/user-and-group-settings.md)' details.

## Group Management

### CanReadGroupTable

The user gains the ability to see the list of all [AzureAD and RealmJoin internal groups](../../user-group-device-management/group-list/).&#x20;

### CanReadGroupDetails

The user gains the ability to inspect an individual AzureAD / RealmJoin internal [group's details](../../user-group-device-management/group-list/group-details.md).

### CanChangeGroupMembers

**Given**:&#x20;

* CanReadGroupDetails

The user gains the ability to add or remove members from groups.&#x20;

### CanDeleteGroup

**Given**:&#x20;

* CanReadGroupDetails

The user gains the ability to delete a group.

### CanEditGroupDisplayName

**Given**:&#x20;

* CanReadGroupDetails

The user gains the ability to change a groups display name.

### CanSeeGroupJsonAzureAD and CanSeeGroupJsonRealmJoin

**Given**:&#x20;

* CanReadGroupDetails

Allow the user to see diagnostic metadata about a AzureAD or RealmJoin internal group, if "Show advanced info" is enabled in [Settings](../general.md).

### CanSeeRealmJoinGroupSettings

**Given**:&#x20;

* CanReadGroupDetails

Allow the user to see/inspect [RealmJoin Client Settings](../../user-group-device-management/user-and-group-settings.md) assigned to a specific group.

### CanChangeRealmJoinGroupSettings

**Given**:&#x20;

* CanReadGroupDetails
* CanSeeRealmJoinGroupSettings

Allow the user to add/modify/delete[ RealmJoin Client Settings](../../user-group-device-management/user-and-group-settings.md) assigned to a specific group.

### CanReadGroupSettingTable

The user gains the ability to see the list of [group settings](../../user-group-device-management/user-and-group-settings.md) (across all groups) from the [navigation](available-permissions.md#navigation).

### CanReadGroupSettingDetails

The user gains the ability to inspect all [group settings](../../user-group-device-management/user-and-group-settings.md)' details.

## Self Service Forms

### CanAddSelfServiceForms and CanDeleteSelfServiceForms

**Given**:&#x20;

* Self Service Forms are enabled for your tenant
* User has access to [Settings](../)

The user can create new or delete Self Service Forms in [Settings->Self Service Forms](../../self-service-forms.md#settings-page) respectively.&#x20;
