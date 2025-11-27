# Available Permissions

## Overview

This page will try to list and explain available permissions for Custom Roles.

{% hint style="info" %}
This list is not complete, as the feature-set of RealmJoin is continually growing.&#x20;

Please use [Auto-Complete](./#auto-complete) in Custom Roles' editor to see all currently available permissions.
{% endhint %}

## Settings

### CanReadSettingsDetails

The user gains access to to [Settings](../../settings.md)

## App Management

### CanReadAppTable

The user gains read access to [Package Management](../../../app-management/packages/package-management.md) (Package Management List). This does not grant permission to the package details.

### CanReadIntuneAppDetails

**Given**:

* User has access [Package Management](../../../app-management/packages/package-management.md)&#x20;

The user gains read only access to Intune packages / [package details](../../../app-management/packages/package-details.md).

### CanReadRealmJoinAppDetails

**Given**:

* User has access [Package Management](../../../app-management/packages/package-management.md)&#x20;

The user gains read only access to RealmJoin Client packages / [package details](../../../app-management/packages/package-details.md).

### CanChangeAppAssignments

**Given**:

* User has access to [Package Details](../../../app-management/packages/package-details.md)

The user gains the ability to add/remove user or group assignments in a packages details. &#x20;

### CanChangeAppAssignmentSettings

**Given**:

* User has access to [Package Details](../../../app-management/packages/package-details.md)

On RealmJoin Client Packages, the option to change [per assignment settings](../../../app-management/packages/package-details.md#assignment-settings) will be shown and users can modify the settings.

### CanEditAppArgs&#x20;

**Given**:

* User has access to [Package Details](../../../app-management/packages/package-details.md)

The user gains the ability to modify an app's command line arguments in [Package Details](../../../app-management/packages/package-details.md).

### CanEditAppAutomation&#x20;

**Given**:

* User has access to [Package Details](../../../app-management/packages/package-details.md)

The user gains the ability to modify an [Intune app's automation](../../../app-management/packages/package-details.md#automation) settings ( = If and when newer versions of the package from the store will be automatically rolled out to existing users.)&#x20;

### CanEditAppDisplayName&#x20;

**Given**:

* User has access to [Package Details](../../../app-management/packages/package-details.md)

The user gains the ability to modify an app's display name.

### CanEditAppExpertSettings&#x20;

**Given**:

* User has access to [Package Details](../../../app-management/packages/package-details.md)

The user gains the ability to modify an [app's expert settings](../../../app-management/packages/package-details.md#expert-settings).

### CanEditAppTechnicalApplicationOwners&#x20;

**Given**:

* User has access to [Package Details](../../../app-management/packages/package-details.md)

The user gains the ability to modify an app's Technical App. Owners in [Config](../../../app-management/packages/package-details.md#config).

### CanDeleteApp

**Given**:

* User has access to [Package Details](../../../app-management/packages/package-details.md)

The user gains the ability to delete an app from a [Package Management](../../../app-management/packages/package-management.md). This will not remove an app from the package store and will not trigger uninstallations on existing deployments.

### CanRequestSoftware

The user gains the ability to submit a software packaging request to RealmJoin.

{% hint style="warning" %}
Please combine this with either **CanRequestSoftwareOrganic** or **CanRequestSoftwarePaas**
{% endhint %}

### CanRequestSoftwareOrganic

The user gains the ability to submit an "organic" software package to RealmJoin for distribution via RealmJoin Client to specific users.

Organic packages contain raw and unprocessed application setups. When handling those, RealmJoin is used as a transport vehicle to move the zipped container to a specified location. Depending on its payload, the installer then has to be manually started by the user (if user mode) or a remote administrator or field service.

The software deployment will not be tested by RealmJoin.

### CanRequestSoftwarePaas

The user gains the ability to submit a software packaging request to RealmJoin.

The software will be packaged by RealmJoin and will become available for consumption through the [Package Store](../../../app-management/packages/package-store/).

### CanReadPackageStoreTable

The user gains access to the [Package Store](../../../app-management/packages/package-store/) (Package Store List).

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

Allow to see additional, diagnostic JSON information for a package in [Package Store](../../../app-management/packages/package-store/) or [Package Management](../../../app-management/packages/package-management.md).&#x20;

## User Management

### CanReadUserTable&#x20;

The user gains the ability to see the [list of all Entra ID users](../../../ugd-management/user-list/).

### CanReadUserDetails&#x20;

The user gains the ability to inspect an individual [user's details](../../../ugd-management/user-list/user-details.md).

### CanSeeRealmJoinUserSettings&#x20;

**Given**:&#x20;

* CanReadUserDetails

Allow the user to see/inspect [RealmJoin Client Settings](../../../ugd-management/user-and-group-settings/) assigned to a specific user.

### CanChangeRealmJoinUserSettings

**Given**:&#x20;

* CanReadUserDetails
* CanSeeRealmJoinUserSettings

Allow the user to add/modify/delete[ RealmJoin Client Settings](../../../ugd-management/user-and-group-settings/) assigned to a specific user.

### CanReadUserSettingTable&#x20;

The user gains the ability to see the list of [user settings](../../../ugd-management/user-and-group-settings/) (across all users) from the [navigation](available-permissions.md#navigation).

### CanReadUserSettingDetails&#x20;

The user gains the ability to inspect all [user settings](../../../ugd-management/user-and-group-settings/)' details.

### CanSeeUserJsonAzureAD and CanSeeUserJsonRealmJoin&#x20;

**Given**:&#x20;

* CanReadUserDetails

These permissions allow a user to see specific diagnostic information as JSON in separate tabs if "show advanced info" is enabled in [Settings](../../general.md).

### CanSeeUserSignIns&#x20;

**Given**:&#x20;

* CanReadUserDetails

These permissions allow a user to see Microsoft Entra user sign in information as JSON in a separate tab.

## Group Management

### CanReadGroupTable

The user gains the ability to see the list of all [Entra ID and RealmJoin internal groups](../../../ugd-management/user-list/).&#x20;

### CanReadGroupDetails

The user gains the ability to inspect an individual Microsoft Entra / RealmJoin internal [group's details](../../../ugd-management/user-list/group-details.md).

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

The user gains the ability to change a group's display name.

### CanSeeGroupJsonAzureAD and CanSeeGroupJsonRealmJoin

**Given**:&#x20;

* CanReadGroupDetails

Allow the user to see diagnostic metadata about a Microsoft Entra or RealmJoin internal group, if "Show advanced info" is enabled in [Settings](../../general.md).

### CanSeeRealmJoinGroupSettings

**Given**:&#x20;

* CanReadGroupDetails

Allow the user to see/inspect [RealmJoin Client Settings](../../../ugd-management/user-and-group-settings/) assigned to a specific group.

### CanChangeRealmJoinGroupSettings

**Given**:&#x20;

* CanReadGroupDetails
* CanSeeRealmJoinGroupSettings

Allow the user to add/modify/delete[ RealmJoin Client Settings](../../../ugd-management/user-and-group-settings/) assigned to a specific group.

### CanReadGroupSettingTable

The user gains the ability to see the list of [group settings](../../../ugd-management/user-and-group-settings/) (across all groups) from the [navigation](available-permissions.md#navigation).

### CanReadGroupSettingDetails

The user gains the ability to inspect all [group settings](../../../ugd-management/user-and-group-settings/)' details.

## Device Management

### CanReadDeviceTable&#x20;

The user gains the ability to see the list of all [Entra ID devices](../../../ugd-management/user-list/).

### CanReadDeviceDetails&#x20;

The user gains the ability to inspect an individual [device's details](../../../ugd-management/user-list/device-details.md).

### CanRequestDeviceLogs&#x20;

The user can trigger collecting "Extended Logs" for a device using RealmJoin Client .

<figure><img src="../../../.gitbook/assets/image (279).png" alt=""><figcaption><p>Request RealmJoin Client Logs</p></figcaption></figure>

### CanScanDevice&#x20;

The user can trigger a Defender for Endpoint scan for a Windows device.

### CanSyncDevice&#x20;

The user can trigger an Intune sync for a managed Windows device.

### CanChangeRealmJoinPrimaryUser&#x20;

Allow the user to assign a different primary user in RealmJoin.&#x20;

{% hint style="info" %}
When transferring a Windows device to a different user, you should wipe the device from Intune.&#x20;

When a new user logs on after the wipe, this will update the Intune and RealmJoin primary user automatically.
{% endhint %}

### CanSeeDeviceAutopilotInformation&#x20;

Allow the user to see a device's Autopilot information (if present)

<figure><img src="../../../.gitbook/assets/image (250).png" alt="" width="354"><figcaption><p>Autopilot info</p></figcaption></figure>

### CanSeeDeviceExtendedSecurityInformation

Allow the user to see a device's extended sec. info from Defender for Endpoint - if available.

<figure><img src="../../../.gitbook/assets/image (243).png" alt="" width="325"><figcaption><p>Extended Security Information</p></figcaption></figure>

### CanSeeDeviceExternalLinks&#x20;

Allow the user to see links to Intune, Microsoft Entra etc. Only useful if the user is allowed to use these portals.

<figure><img src="../../../.gitbook/assets/image (275).png" alt=""><figcaption><p>Device External Links</p></figcaption></figure>

### CanSeeDeviceJson...

These permissions allow a user to see specific diagnostic information as JSON in separate tabs if "show advanced info" is enabled in [Settings](../../general.md).

* CanSeeDeviceJsonAtp
* CanSeeDeviceJsonAutopilot&#x20;
* CanSeeDeviceJsonAzureAD&#x20;
* CanSeeDeviceJsonIntune&#x20;
* CanSeeDeviceJsonRealmJoin&#x20;

### CanSeeDeviceNetworkInformation&#x20;

Allow the user to see network information for a device if available.&#x20;

&#x20;This will include "Delivery Optimization" information if available.&#x20;

<figure><img src="../../../.gitbook/assets/image (233).png" alt="" width="337"><figcaption><p>Network Information</p></figcaption></figure>

### CanSeeDeviceRealmJoinInformation&#x20;

Allow the user to see RealmJoin Client details or a device.

<figure><img src="../../../.gitbook/assets/image (126).png" alt="" width="375"><figcaption><p>RealmJoin Client Information</p></figcaption></figure>

### CanSeeDeviceSafeguardHold&#x20;

Allow the use to see the **Safeguard Holds** for a device.&#x20;

Safeguard Holds indicate that a Windows device can not upgrade to a newer version of Windows.

See [Safeguard Holds (Microsoft Docs)](https://learn.microsoft.com/en-us/windows/deployment/update/safeguard-holds).

### CanSeeDeviceSecurityInformation&#x20;

Allow the user to see a device's security state, especially **device compliance**.

<figure><img src="../../../.gitbook/assets/image (266).png" alt="" width="332"><figcaption><p>Device Security Information</p></figcaption></figure>

### CanSeeDeviceSecurityRecommendations and CanSeeDeviceSecurityVulnerabilities&#x20;

RealmJoin Portal can pull security recommendations and vulnerabilities from the Microsoft Security Center. This permission allows a user to see these for a device respectively.

<figure><img src="../../../.gitbook/assets/image (128).png" alt="" width="375"><figcaption><p>Security Vulnerability</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (256).png" alt="" width="349"><figcaption><p>Security Recommendations</p></figcaption></figure>

### CanSeeDeviceUsers&#x20;

Allow the user to see the devices logged in user.

{% hint style="warning" %}
Be aware: If not given this permission, a user able to see the device's details can still see the device's owner.
{% endhint %}

### CanSeeWarranty&#x20;

Allow the user to use the[ warranty tab](../../../ugd-management/user-list/device-details.md#warranty) for a device.

### CanUseDeviceAnyDeskInterface

Allow the user to use / connect to a device using [AnyDesk AnyConnect](../../../realmjoin-agent/realmjoin-client/anydesk-integration/) from RealmJoin Portal.

<figure><img src="../../../.gitbook/assets/image (255).png" alt="" width="521"><figcaption><p>AnyConnect Remote Support</p></figcaption></figure>

## Organization

### CanReadOrganizationDetails

Allow the user to see / read the [Organization details](../../../ugd-management/organization-details.md).

### CanSeeOrganizationJsonAzureAD

These permissions allow a user to see specific diagnostic information as JSON in separate tabs if "show advanced info" is enabled in [Settings](../../general.md).

## Self Service Forms

### CanReadSelfServiceFormsHistoryTable

The user can see the list of recent [Self Service Forms](../../self-service-forms.md) submissions.

### CanReadSelfServiceFormsHistoryDetails

The user can inspect individual [Self Service Forms](../../self-service-forms.md) submission details and contents.

### CanAddSelfServiceForms and CanDeleteSelfServiceForms

**Given**:&#x20;

* Self Service Forms are enabled for your tenant
* User has access to [Settings](../../settings.md)

The user can create new or delete Self Service Forms in [Settings->Self Service Forms](../../self-service-forms.md#settings-page) respectively.&#x20;

## Runbooks

### CanSeeRunbooks

The user can see the list of available runbooks, limited by:

* Object types (Users/Groups/Devices/Org) the user can see
* Runbooks as limited by [Runbook Permissions](../../../automation/runbooks/runbook-permissions.md)

This does not grant the right to actually start Runbook jobs.

### CanRunRunbooks

The user can start Runbooks, if CanSeeRunbooks is given and the conditions listed there are met.

### CanEditRunbookSchedules

If the user is able to see Runbooks, he/she can create/manage [Runbook Schedules](../../../automation/runbooks/scheduling.md).

## Logs

### CanReadRunbookTable

Allow a user to see the [Runbook Logs](../../../automation/runbooks/runbook-logs/) list.

### CanReadRunbookDetails

Allow a user to inspect a [Runbook Logs](../../../automation/runbooks/runbook-logs/) item and output.

## Workplace Cloud Storage

### CanSeeOrganizationBackgroundFiles, CanSeeOrganizationSignatureFiles, CanSeeOrganizationOtherFiles and CanReadFavoritesTable

View the named areas of Workplace Cloud storage.

### CanUploadOrganizationBackgroundFiles, CanEditOrganizationSignatureFiles, CanUploadOrganizationOtherFiles and CanEditFavorites

Upload resp. edit the named areas of Workplace Cloud storage.

### CanDeleteOrganizationBackgroundFiles, CanDeleteOrganizationSignatureFiles, CanDeleteOrganizationOtherFiles and CanDeleteFavorites

Delete files in the named areas of Workplace Cloud storage.
