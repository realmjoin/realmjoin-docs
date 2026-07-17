---
type: RealmJoin Settings
description: >-
  Complete reference of the granular permissions you can assign to RealmJoin
  custom roles, grouped by area.
---

# Available Permissions

## Overview

This page lists the granular permissions you can assign to [Custom Roles](./), grouped by the area of RealmJoin Portal they apply to.

{% hint style="info" %}
The definitive, always-current list is shown by the [Auto-Complete](./#auto-complete) in the Custom Roles editor. Because RealmJoin's feature set keeps growing, the editor may occasionally offer a permission that is newer than this page.
{% endhint %}

{% hint style="info" %}
Permissions build on each other. A permission that shows or changes *details* usually also requires the matching *read* permission (for example, changing a setting requires being able to see it first). Where a specific prerequisite applies, it is noted in the **Requires** column.
{% endhint %}

## Settings & Administration

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadSettingsDetails` | — | Access the [Settings](../../settings.md) area. |
| `CanChangeTenantSettings` | `CanReadSettingsDetails` | Modify tenant-wide settings. |
| `CanReadOrganizationFeatures` | — | View the tenant's enabled RealmJoin features. |
| `CanEditOrganizationFeatures` | `CanReadOrganizationFeatures` | Enable or disable RealmJoin features for the tenant. |
| `CanEditTenantLaMetricSecret` | — | Manage the secret for the [LaMetric Time](../../../administration-and-settings/third-party-integrations/lametric-time.md) integration. |

## App Management

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadAppTable` | — | Read access to [Package Management](../../../app-management/packages/package-management.md) (the package list). Does not grant access to package details. |
| `CanReadIntuneAppDetails` | `CanReadAppTable` | Read-only access to Intune [package details](../../../app-management/packages/package-details.md). |
| `CanReadRealmJoinAppDetails` | `CanReadAppTable` | Read-only access to RealmJoin Client [package details](../../../app-management/packages/package-details.md). |
| `CanChangeAppAssignments` | Package details access | Add or remove user/group assignments on a package. |
| `CanSeeAppAssignmentSettings` | Package details access | See the [per-assignment settings](../../../app-management/packages/package-details.md#assignment-settings) of a RealmJoin Client package. |
| `CanChangeAppAssignmentSettings` | `CanSeeAppAssignmentSettings` | Modify the per-assignment settings of a RealmJoin Client package. |
| `CanSeeAppExpertSettings` | Package details access | See an [app's expert settings](../../../app-management/packages/package-details.md#expert-settings). |
| `CanEditAppExpertSettings` | `CanSeeAppExpertSettings` | Modify an app's expert settings. |
| `CanEditAppSettings` | Package details access | Modify an app's general settings. |
| `CanEditAppAutomation` | Package details access | Modify an [app's automation](../../../app-management/packages/package-details.md#automation) (if/when newer store versions roll out automatically). |
| `CanEditAppDisplayName` | Package details access | Modify an app's display name. |
| `CanEditAppTechnicalApplicationOwners` | Package details access | Modify an app's Technical Application Owners in [Config](../../../app-management/packages/package-details.md#config). |
| `CanEnableAppUpdateGroup` | Package details access | Enable or disable a package's update group. |
| `CanUpgradeApp` | Package details access | Trigger an upgrade of a package to a newer version. |
| `CanSubscribeApp` | `CanReadPackageStoreDetails` | Subscribe to an offering from the [Package Store](../../../app-management/packages/package-store/). |
| `CanDeleteApp` | Package details access | Delete an app from [Package Management](../../../app-management/packages/package-management.md). Does not remove it from the store or uninstall existing deployments. |
| `CanSeeSoftwareSecurityVulnerabilities` | — | See known security vulnerabilities for software. |
| `CanSeeIntuneAppJson`, `CanSeeIntuneAppStoreJson`, `CanSeeRealmJoinAppJson`, `CanSeeRealmJoinAppStoreJson` | — | See diagnostic JSON for a package in [Package Store](../../../app-management/packages/package-store/) or [Package Management](../../../app-management/packages/package-management.md). Only shown when *Show advanced info* is enabled in [Settings](../../general.md). |

## Package Store

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadPackageStoreTable` | — | Access the [Package Store](../../../app-management/packages/package-store/) list. Does not grant access to details or the ability to subscribe. |
| `CanReadPackageStoreDetails` | `CanReadPackageStoreTable` | Inspect a package store offering. Does not grant the ability to subscribe. |

## Software Requests

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanRequestSoftware` | — | Submit a software packaging request to RealmJoin. Combine with `CanRequestSoftwarePaas` or `CanRequestSoftwareOrganic`. |
| `CanRequestSoftwarePaas` | — | Request a package to be produced by RealmJoin and made available in the [Package Store](../../../app-management/packages/package-store/). |
| `CanRequestSoftwareOrganic` | — | Submit an ["organic" package](../../../app-management/packages/packaging-requests/organic-packages.md) (raw, untested setup) for distribution via RealmJoin Client. |

## App Categories

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadAppCategories` | — | View the tenant's Intune app categories. |
| `CanEditAppCategories` | `CanReadAppCategories` | Create, edit and delete Intune app categories. |

## Software Report

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadSoftwareReportTable` | — | Access the [Software Report](../../../analyze-and-export/software-reporting.md) list. |
| `CanReadSoftwareReportDetails` | `CanReadSoftwareReportTable` | Inspect Software Report details. |

## User Management

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadUserTable` | — | See the [list of all Entra ID users](../../../ugd-management/user-list/). |
| `CanReadUserDetails` | — | Inspect an individual [user's details](../../../ugd-management/user-list/user-details.md). |
| `CanSeeRealmJoinUserSettings` | `CanReadUserDetails` | See the [RealmJoin Client settings](../../../ugd-management/user-and-group-settings/) assigned to a user. |
| `CanChangeRealmJoinUserSettings` | `CanSeeRealmJoinUserSettings` | Add, modify or delete the RealmJoin Client settings assigned to a user. |
| `CanReadUserSettingTable` | — | See the list of [user settings](../../../ugd-management/user-and-group-settings/) across all users. |
| `CanReadUserSettingDetails` | — | Inspect all user settings' details. |
| `CanSeeUserJsonAzureAD`, `CanSeeUserJsonRealmJoin` | `CanReadUserDetails` | See diagnostic JSON tabs for a user. Only shown when *Show advanced info* is enabled in [Settings](../../general.md). |
| `CanSeeUserSignIns` | `CanReadUserDetails` | See Microsoft Entra sign-in information for a user. |

## Group Management

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadGroupTable` | — | See the list of all [Entra ID and RealmJoin internal groups](../../../ugd-management/user-list/). |
| `CanReadGroupDetails` | — | Inspect an individual [group's details](../../../ugd-management/user-list/group-details.md). |
| `CanChangeGroupMembers` | `CanReadGroupDetails` | Add or remove group members. |
| `CanEditGroupDisplayName` | `CanReadGroupDetails` | Change a group's display name. |
| `CanDeleteGroup` | `CanReadGroupDetails` | Delete a group. |
| `CanSeeRealmJoinGroupSettings` | `CanReadGroupDetails` | See the [RealmJoin Client settings](../../../ugd-management/user-and-group-settings/) assigned to a group. |
| `CanChangeRealmJoinGroupSettings` | `CanSeeRealmJoinGroupSettings` | Add, modify or delete the RealmJoin Client settings assigned to a group. |
| `CanReadGroupSettingTable` | — | See the list of [group settings](../../../ugd-management/user-and-group-settings/) across all groups. |
| `CanReadGroupSettingDetails` | — | Inspect all group settings' details. |
| `CanSeeGroupJsonAzureAD`, `CanSeeGroupJsonRealmJoin` | `CanReadGroupDetails` | See diagnostic JSON for a group. Only shown when *Show advanced info* is enabled in [Settings](../../general.md). |
| `CanSeeOwnGroups` | — | Allow a (non-external) user to see the groups and teams they are a member of. |

## Device Management

Actions and operations on devices from [Device Details](../../../ugd-management/user-list/device-details.md).

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadDeviceTable` | — | See the list of all [Entra ID devices](../../../ugd-management/user-list/). |
| `CanReadDeviceDetails` | — | Inspect an individual [device's details](../../../ugd-management/user-list/device-details.md). |
| `CanSyncDevice` | — | Trigger an Intune sync for a managed Windows device. |
| `CanScanDevice` | — | Trigger a Defender for Endpoint scan for a Windows device. |
| `CanRequestDeviceLogs` | — | Trigger collection of "Extended Logs" for a device via RealmJoin Client. |
| `CanChangeRealmJoinPrimaryUser` | — | Assign a different primary user in RealmJoin. |
| `CanRotateIntuneManagedDeviceLocalCredentials` | — | Rotate the Intune-managed local administrator (Windows LAPS) credentials of a device. |
| `CanRotateRecoveryKeys` | — | Rotate a device's disk-encryption recovery key (BitLocker on Windows, FileVault on macOS). |
| `CanUseDeviceAnyDeskInterface` | — | Connect to a device using [AnyDesk AnyConnect](../../../realmjoin-agent/realmjoin-client/anydesk-integration/) from RealmJoin Portal. |

## Device Information

Individual information panels/tabs shown on [Device Details](../../../ugd-management/user-list/device-details.md).

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanSeeDeviceHardwareInformation` | — | See a device's hardware information. |
| `CanSeeDeviceIdentifierInformation` | — | See a device's identifiers. |
| `CanSeeDeviceGroups` | — | See the groups a device is a member of. |
| `CanSeeDeviceRealmJoinInformation` | — | See RealmJoin Client details for a device. |
| `CanSeeDeviceNetworkInformation` | — | See network information for a device, including Delivery Optimization data if available. |
| `CanSeeDeviceUsers` | — | See the device's logged-on user. *(Without it, users who can see device details can still see the device owner.)* |
| `CanSeeDeviceAutopilotInformation` | — | See a device's Autopilot information (if present). |
| `CanSeeDeviceSoftwarePackagesInstalled` | — | See the software packages installed on a device. |
| `CanSeeDeviceSafeguardHold` | — | See [Safeguard Holds](https://learn.microsoft.com/en-us/windows/deployment/update/safeguard-holds) that prevent a Windows feature update. |
| `CanSeeWindowsDeviceUpdatesEnrollmentState` | — | See a Windows device's update (Windows Update for Business) enrollment state. |
| `CanSeeDeviceIntuneManagedLapsStatus` | — | See the Intune-managed LAPS status of a device. |
| `CanSeeWarranty` | — | Use the [Warranty tab](../../../ugd-management/user-list/device-details.md#warranty) for a device. |
| `CanSeeDeviceExternalLinks` | — | See links to Intune, Microsoft Entra, etc. for a device. |
| `CanSeeUserAppCatalog` | — | See the App Catalog tab for a Windows device. |
| `CanEndUserSeeDeviceStorageInformation` | — | Allow an end user to see storage information for their own device. |
| `CanSeeDeviceJsonAtp`, `CanSeeDeviceJsonAutopilot`, `CanSeeDeviceJsonAzureAD`, `CanSeeDeviceJsonIntune`, `CanSeeDeviceJsonRealmJoin` | — | See diagnostic JSON tabs for a device. Only shown when *Show advanced info* is enabled in [Settings](../../general.md). |

## Device Security

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanSeeDeviceSecurityInformation` | — | See a device's security state, especially device compliance. |
| `CanSeeDeviceExtendedSecurityInformation` | — | See extended security info from Defender for Endpoint (if available). |
| `CanSeeDeviceSecurityRecommendations` | — | See Microsoft Security Center recommendations for a device. |
| `CanSeeDeviceSecurityVulnerabilities` | — | See Microsoft Security Center vulnerabilities for a device. |
| `CanSeeDeviceSecurityAlerts` | — | See security alerts for a device. |
| `CanSeeBitLockerKeys` | — | View a device's BitLocker recovery keys. |
| `CanSeeRecoveryKeys` | — | View a device's disk-encryption recovery keys (BitLocker/FileVault). |

## Organization

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadOrganizationDetails` | — | See the [Organization details](../../../ugd-management/organization-details.md). |
| `CanSeeOrganizationJsonAzureAD` | — | See organization diagnostic JSON. Only shown when *Show advanced info* is enabled in [Settings](../../general.md). |

## Self Service Forms

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadSelfServiceFormsHistoryTable` | — | See the list of recent [Self Service Forms](../../self-service-forms.md) submissions. |
| `CanReadSelfServiceFormsHistoryDetails` | — | Inspect individual Self Service Forms submissions. |
| `CanSeeSelfServiceForms` | — | See the configured Self Service Forms. |
| `CanAddSelfServiceForms` | [Settings](../../settings.md) access | Create new [Self Service Forms](../../self-service-forms.md#settings-page). |
| `CanEditSelfServiceForms` | [Settings](../../settings.md) access | Edit existing Self Service Forms. |
| `CanDeleteSelfServiceForms` | [Settings](../../settings.md) access | Delete Self Service Forms. |

## Runbooks

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanSeeRunbooks` | — | See the list of available runbooks (limited by object types the user can see and by [Runbook Permissions](../../../automation/runbooks/runbook-permissions.md)). Does not allow starting jobs. |
| `CanRunRunbooks` | `CanSeeRunbooks` | Start runbook jobs. |
| `CanEditRunbookSchedules` | `CanSeeRunbooks` | Create and manage [runbook schedules](../../../automation/runbooks/). |
| `CanApproveRunbookExecution` | — | Approve runbook executions that require approval. |
| `CanSyncRunbooksWithUpstream` | [Settings](../../settings.md) access | Sync runbooks from RealmJoin's shared repository. |

## Runbook Logs

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadRunbookTable` | — | See the [Runbook Logs](../../../automation/runbooks/runbook-logs/) list. |
| `CanReadRunbookDetails` | `CanReadRunbookTable` | Inspect a Runbook Logs item and its output. |

## Remediation Scripts

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanSeeRemediationScripts` | — | See the [remediation scripts](../../../automation/remediation-scripts.md). |
| `CanRunRemediationScripts` | `CanSeeRemediationScripts` | Run proactive remediation scripts. |

## Device Health Scripts

Manage Intune [remediation / device health scripts](../../../automation/remediation-scripts.md).

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadDeviceHealthScriptsTable` | — | See the list of device health scripts. |
| `CanReadDeviceHealthScriptsDetails` | `CanReadDeviceHealthScriptsTable` | Inspect a device health script. |
| `CanStageDeviceHealthScripts` | — | Stage / import device health scripts. |
| `CanAssignDeviceHealthScripts` | — | Assign device health scripts to groups. |
| `CanScheduleDeviceHealthScripts` | — | Schedule device health scripts. |
| `CanDeleteDeviceHealthScripts` | — | Delete device health scripts. |

## Notifications

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadNotificationTable` | — | See the list of [notifications](../../../realmjoin-agent/realmjoin-client/showing-notifications.md). |
| `CanReadNotificationDetails` | `CanReadNotificationTable` | Inspect a notification. |

## Templates

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadTemplateTable` | — | See the list of templates. |
| `CanReadTemplateDetails` | `CanReadTemplateTable` | Inspect a template. |
| `CanEditTemplate` | — | Edit a template. |
| `CanDeleteTemplate` | — | Delete a template. |
| `CanChangeTemplatePackages` | — | Change the packages contained in a template. |
| `CanChangeTemplateTokens` | — | Change a template's tokens. |

## Changelog

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadChangelogTable` | — | See the changelog list. |
| `CanReadChangelogDetails` | `CanReadChangelogTable` | Inspect a changelog entry. |
| `CanSeeChangelog` | — | See changelog information in the Portal. |

## Profiles

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadProfileTable` | — | See the list of profiles. |
| `CanReadProfileDetails` | `CanReadProfileTable` | Inspect a profile. |

## Operations

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadOperationsTable` | — | See the operations list. |
| `CanReadOperationsDetails` | `CanReadOperationsTable` | Inspect an operation. |

## Networks & Delivery Optimization

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadNetworksTable` | — | See the networks list. |
| `CanReadDONetworkTable` | — | See the Delivery Optimization networks list. |
| `CanReadDONetworkDetails` | `CanReadDONetworkTable` | Inspect a Delivery Optimization network. |

## Logs

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadLogsTable` | — | See the audit/log list. |
| `CanReadLogDetails` | `CanReadLogsTable` | Inspect a log entry. |

## Data Export

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadExportsTable` | — | Access the [Data Export](../../../analyze-and-export/data-export.md) page and download predefined exports. |

## Workplace Cloud Storage

See, upload/edit and delete the different areas of [Workplace Cloud Storage](../../workplace-cloud-storage.md).

| Permission | Requires | Description |
| ---------- | -------- | ----------- |
| `CanReadFavoritesTable` | — | View the Favorites list. |
| `CanReadFavoritesDetails` | `CanReadFavoritesTable` | Inspect Favorites details. |
| `CanEditFavorites` | — | Edit Favorites. |
| `CanDeleteFavorites` | — | Delete Favorites. |
| `CanSeeOrganizationBackgroundFiles` | — | View background image files. |
| `CanUploadOrganizationBackgroundFiles` | — | Upload background image files. |
| `CanDeleteOrganizationBackgroundFiles` | — | Delete background image files. |
| `CanSeeOrganizationSignatureFiles` | — | View e-mail signature files. |
| `CanEditOrganizationSignatureFiles` | — | Edit e-mail signature files. |
| `CanDeleteOrganizationSignatureFiles` | — | Delete e-mail signature files. |
| `CanSeeOrganizationOtherFiles` | — | View other organization files. |
| `CanUploadOrganizationOtherFiles` | — | Upload other organization files. |
| `CanDeleteOrganizationOtherFiles` | — | Delete other organization files. |
