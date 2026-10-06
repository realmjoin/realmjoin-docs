---
title: Check Intune Enrollment Readiness
description: Check whether this user can enroll devices in Intune
---

## Description
Checks whether this user is ready to enroll a device in Intune and reports Ready, Ready with warnings or Not ready together with the blockers found. The check covers the account status, the Intune license, the device enrollment limit, platform restrictions and Conditional Access policies that target device registration or enrollment. Nothing is changed. Details on the checks are in the runbook documentation (docs.realmjoin.com).

## Interpretation notes

- Checks performed: account state, Intune license and service plan, tenant MDM authority, device enrollment limit, platform restrictions, registered authentication methods, Conditional Access policies and, optionally, pilot group membership.
- Conditional Access is evaluated as a static "What If" against the enrollment sign-in for the selected `EnrollmentPlatform`; Entra's own What If tool remains the authority.
- Compliant-device requirements on "All resources" policies do not block enrollment (a documented Entra exemption); only policies targeting device registration or the Intune enrollment apps are treated as strict gates.
- Not evaluated statically: named locations, device filters, sign-in frequency and terms of use.
- Expired or already used Temporary Access Passes are not counted as usable methods.

## Prerequisites

The tenant MDM authority must be "intune" or "office365"; other values block every user.

## What is checked

The readiness verdict combines these checks:

- Account status (enabled, not blocked) and an Intune license assigned to the user.
- The tenant's device enrollment limit for the user and the platform restrictions of the enrollment configuration.
- Conditional Access policies that explicitly target device registration or Intune enrollment. Policies that require a compliant device via *All resources* are exempted by Microsoft Entra design and therefore not counted as blockers.
- Platform-scoped policies and browser-only client-app requirements are evaluated against the chosen enrollment platform; with *All platforms* every platform is evaluated and reported separately.

The runbook only reads; it changes nothing on the user or the tenant.


## Location
User → General → Check Intune Enrollment Readiness

**Full Runbook name**

rjgit-user_general_check-intune-enrollment-readiness

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.Read.All
    - *Reads /deviceManagement/deviceEnrollmentConfigurations (limit and platform restriction configs, with assignments expanded) to evaluate enrollment limit and platform restriction findings*
  - Group.Read.All
    - *Reads /groups?$filter=displayName eq '...' to resolve the optional pilot group by name*
  - GroupMember.Read.All
    - *Reads /groups/{id}/transitiveMembers/microsoft.graph.user to check pilot-group membership and /users/{id}/transitiveMemberOf/microsoft.graph.group to resolve the target user's group memberships for Conditional Access include/exclude group scoping*
  - Organization.Read.All
    - *Reads /v1.0/organization/{tenantId}?$select=id,displayName,mobileDeviceManagementAuthority to determine the tenant's MDM authority, an unconditional tenant-level enrollment blocker check; the tenant ID is taken from Get-MgContext as a fast path, falling back to GET /v1.0/organization?$select=id when the Graph context does not yield one*
  - Policy.Read.All
    - *Reads /identity/conditionalAccess/policies to evaluate enabled policies that could block Intune enrollment for the user*
  - RoleManagement.Read.Directory
    - *Populates the roleTemplateId of the directoryRole objects returned by /users/{id}/transitiveMemberOf/microsoft.graph.directoryRole, which Conditional Access includeRoles/excludeRoles scoping is matched against. User.Read.All authorizes the call itself but leaves directoryRole properties null, which would silently make every role-scoped policy appear not to apply*
  - User.Read.All
    - *Reads /users/{id} (accountEnabled, assignedLicenses, usageLocation) to resolve the target user, /subscribedSkus to determine which licenses include an Intune service plan, /users/{id}/ownedDevices to count registered devices against the enrollment limit, and /users/{id}/transitiveMemberOf/microsoft.graph.directoryRole to resolve the user's directory roles for Conditional Access includeRoles/excludeRoles scoping*
  - UserAuthenticationMethod.Read.All
    - *Reads /users/{id}/authentication/methods to determine whether the user has a registered method that can satisfy Conditional Access MFA grant controls*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### EnrollmentPlatform

Platform of the device the user wants to enroll. Conditional Access policies scoped to other platforms are ignored; All platforms checks every platform and reports each one.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Windows |
| Type | String |
| Portal display name | Platform to enroll |

**Portal options**

| Portal option | Value |
| --- | --- |
| Windows | Windows |
| iOS / iPadOS | iOS |
| Android | Android |
| macOS | macOS |
| All platforms | All |

### CheckPilotGroupMembership

Also requires the user to be in the pilot group. Non-members are reported as Not ready.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Check pilot group membership? |

### PilotGroupDisplayName

Members of this group count as pilot users. The group is looked up by its display name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | col - All Users - Pilot (users) |
| Type | String |
| Portal display name | Pilot group name |



[Back to Runbook Reference overview](../../README.md)

