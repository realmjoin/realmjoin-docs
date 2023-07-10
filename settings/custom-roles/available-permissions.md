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

The user gains read only access to Intune packages / package details.

### CanReadRealmJoinAppDetails

**Given**:

* User has access [Package Management](../../AppManagement/package-management/)&#x20;

The user gains read only access to RealmJoin Client packages / package details.

## Self Service Forms

### CanAddSelfServiceForms and CanDeleteSelfServiceForms

**Given**:&#x20;

* Self Service Forms are enabled for your tenant
* User has access to [Settings](../)

The user can create new or delete Self Service Forms in [Settings->Self Service Forms](../../self-service-forms.md#settings-page) respectively.&#x20;
