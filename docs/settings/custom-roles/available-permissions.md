# Available Permissions

## Overview

This page will try to list and explain available permissions to use in Custom Roles.

{% hint style="info" %}
This list is not complete, as the feature-set of RealmJoin is continually growing.&#x20;

Please use [Auto-Complete](./#auto-complete) in Custom Roles' editor to see all currently available permissions.
{% endhint %}

We will expand this list over time.

As there are many permissions available, we will group them by topic for easier naviagtion.

## Settings

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

### CanRequestSoftware

The user gains the ability to submit a software packaging request to glueckkanja.

{% hint style="warning" %}
Please combine this with either **CanRequestSoftwareOrganic** or **CanRequestSoftwarePaas**
{% endhint %}

### CanRequestSoftwareOrganic

The user gains the ability to submit an "organic" software package to glueckkanja for distribution via RealmJoin Client to specific users.

Organic packages contain raw and unprocessed application setups. When handling those, RealmJoin is used as a transport vehicle to move the zipped container to a specified location. Depending on its payload, the installer then has to be manually started by the user (if user mode) or a remote administrator or field service.

The software deployment will not be tested by glueckkanja.

### CanRequestSoftwarePaas

The user gains the ability to submit a software packaging request to glueckkanja.

The software will be packaged by glueckkanja and will become available for consumption through the [Package Store](../../AppManagement/package-store/).

### CanReadPackageStoreTable

The user gains access to the [Package Store](../../AppManagement/package-store/) (Package Store List).

This does not grant permission to the package details or to subscribe to an app.

### CanReadPackageStoreDetails

Given:

* CanReadPackageStoreTable

Allow a user to inspect a package store offering. This does not grant permission to subscribe to an app.

### CanSubscribeApp

Given:

* CanReadPackageStoreDetails

Allow the user to subscribe to an offering from package store.

### CanSeeIntuneAppJson, CanSeeIntuneAppStoreJson, CanSeeRealmJoinAppJson, CanSeeRealmJoinAppStoreJson

Allow to see additional, diagnostic JSON information for a package in [Package Store](../../AppManagement/package-store/) or [Package Management](../../AppManagement/package-management/).&#x20;

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

### CanSeeUserJsonAzureAD and CanSeeUserJsonRealmJoin&#x20;

**Given**:&#x20;

* CanReadUserDetails

These permissions allow a user to see specific diagnostic information as JSON in separate tabs if "show advanced info" is enabled in [Settings](../general.md).

### CanSeeUserSignIns&#x20;

**Given**:&#x20;

* CanReadUserDetails

These permissions allow a user to see AzureAD user sign in information as JSON in a separate tab.

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

## Device Management

### CanReadDeviceTable&#x20;

The user gains the ability to see the list of all [AzureAD devices](../../user-group-device-management/device-list/).

### CanReadDeviceDetails&#x20;

The user gains the ability to inspect an individual [device's details](../../user-group-device-management/device-list/device-details.md).

### CanRequestDeviceLogs&#x20;

The user can trigger collecting "Extended Logs" for a device using RealmJoin Client .

<figure><img src="../../.gitbook/assets/image (29).png" alt=""><figcaption><p>Request RealmJoin Client Logs</p></figcaption></figure>

### CanScanDevice&#x20;

The user can trigger a Defender for Endpoint scan for a Windows device.

### CanSyncDevice&#x20;

The user can trigger an Intune sync for a managed Windows device.

### CanChangeRealmJoinPrimaryUser&#x20;

Allow the user to assign a different primary user in RealmJoin.&#x20;

{% hint style="info" %}
When transfering a Windows device to a different user, you should change the RealmJoin primary user AND wipe the device. When a new user logs on after the wipe, this will also update the Intune primary user.
{% endhint %}

### CanSeeDeviceAutopilotInformation&#x20;

Allow the user to see a device's Autopilot information (if present)

<figure><img src="../../.gitbook/assets/image (13).png" alt=""><figcaption><p>Autopilot info</p></figcaption></figure>

### CanSeeDeviceExtendedSecurityInformation

Allow the user to see a device's extended sec. info from Defender for Endpoint - if available.

<figure><img src="../../.gitbook/assets/image (9).png" alt=""><figcaption><p>Extended Security Information</p></figcaption></figure>

### CanSeeDeviceExternalLinks&#x20;

Allow the user to see links to Intune, AzureAD etc. Only useful if the user is allowed to use these portals.

<figure><img src="../../.gitbook/assets/image (24).png" alt=""><figcaption><p>Device External Links</p></figcaption></figure>

### CanSeeDeviceJson...

These permissions allow a user to see specific diagnostic information as JSON in separate tabs if "show advanced info" is enabled in [Settings](../general.md).

* CanSeeDeviceJsonAtp
* CanSeeDeviceJsonAutopilot&#x20;
* CanSeeDeviceJsonAzureAD&#x20;
* CanSeeDeviceJsonIntune&#x20;
* CanSeeDeviceJsonRealmJoin&#x20;

### CanSeeDeviceNetworkInformation&#x20;

Allow the user to see network information for a device if available.&#x20;

&#x20;This will include "Delivery Optimization" information if available.&#x20;

<figure><img src="../../.gitbook/assets/image (8).png" alt=""><figcaption><p>Network Information</p></figcaption></figure>

### CanSeeDeviceRealmJoinInformation&#x20;

Allow the user to see RealmJoin Client details or a device.

<figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption><p>RealmJoin Client Information</p></figcaption></figure>

### CanSeeDeviceSafeguardHold&#x20;

Allow the use to see the **Safeguard Holds** for a device.&#x20;

Safeguard Holds indicate that a Windows device can not upgrade to a newer version of Windows.

See [Safeguard Holds (Microsoft Docs)](https://learn.microsoft.com/en-us/windows/deployment/update/safeguard-holds).

### CanSeeDeviceSecurityInformation&#x20;

Allow the user to see a device's security state, especially **device compliance**.

<figure><img src="../../.gitbook/assets/image (5).png" alt=""><figcaption><p>Device Security Information</p></figcaption></figure>

### CanSeeDeviceSecurityRecommendations and CanSeeDeviceSecurityVulnerabilities&#x20;

RealmJoin Portal can pull security recommendations and vulnerabilities from the Microsoft Security Center. This permission allows a user to see these for a device respectively.

<figure><img src="../../.gitbook/assets/image (1) (2).png" alt=""><figcaption><p>Security Vulnerability</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (33).png" alt=""><figcaption><p>Security Recommendations</p></figcaption></figure>

### CanSeeDeviceUsers&#x20;

Allow the user to see the devices logged in user.

{% hint style="warning" %}
Be aware: If not given this permission, a user able to see the device's details can still see the device's owner.
{% endhint %}

### CanSeeWarranty&#x20;

Allow the user to use the[ warranty tab](../../user-group-device-management/device-list/device-details.md#warranty) for a device.

### CanUseDeviceAnyDeskInterface

Allow the user to use / connect to a device using [AnyDesk AnyConnect](../../realmjoin-client/anydesk-integration/) from RealmJoin Portal.

<figure><img src="../../.gitbook/assets/image (26).png" alt=""><figcaption><p>AnyConnect Remote Support</p></figcaption></figure>

## Organization

### CanReadOrganizationDetails

Allow the user to see / read the [Organization details](../../user-group-device-management/organization-details.md).

### CanSeeOrganizationJsonAzureAD

These permissions allow a user to see specific diagnostic information as JSON in separate tabs if "show advanced info" is enabled in [Settings](../general.md).

## Self Service Forms

### CanReadSelfServiceFormsHistoryTable

The user can see the list of recent [Self Service Forms](../../self-service-forms.md) submissions.

### CanReadSelfServiceFormsHistoryDetails

The user can inspect individual [Self Service Forms](../../self-service-forms.md) submission details and contents.

### CanAddSelfServiceForms and CanDeleteSelfServiceForms

**Given**:&#x20;

* Self Service Forms are enabled for your tenant
* User has access to [Settings](../)

The user can create new or delete Self Service Forms in [Settings->Self Service Forms](../../self-service-forms.md#settings-page) respectively.&#x20;

## Runbooks

### CanSeeRunbooks

The user can see the list of available runbooks, limited by:

* Object types (Users/Groups/Devices/Org) the user can see
* Runbooks as limited by [Runbook Permissions](../runbook-permissions.md)

This does not grant the right to actually start Runbook jobs.

### CanRunRunbooks

The user can start Runbooks, if CanSeeRunbooks is given and the conditions listed there are met.

### CanEditRunbookSchedules

If the user is able to see Runbooks, he/she can create/manage [Runbook Schedules](../../runbooks/scheduling.md).

## Logs

### CanReadRunbookTable

Allow a user to see the [Runbook Logs](../../runbooks/runbook-logs/) list.

### CanReadRunbookDetails

Allow a user to inspect a [Runbook Logs](../../runbooks/runbook-logs/) item and output.
