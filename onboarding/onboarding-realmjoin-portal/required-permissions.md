# Required Permissions

RealmJoin Portal consists of multiple apps which are used for different use cases.

## RealmJoin Portal

Application ID: `b0130885-16be-4c6f-83de-5b1042b5d2e3`

Users interact with this app for self services. Admins use this app to interact with all RealmJoin Portal features. This includes onboarding the [Core Features permissions](required-permissions.md#api-permissions-1).

All of the following permissions are of the permission type “**Delegated**” ( = can only operate when a user is interactively signed in). Also this app can be **consented per User** ( = admin consent is optional).

All of the following permissions target [MS Graph API](https://docs.microsoft.com/en-us/graph/api/overview?view=graph-rest-1.0). You can read more about the individual permissions [here](https://docs.microsoft.com/en-us/graph/permissions-reference).

These permissions are required for basic functionality of the app per user.

### API Permissions

| Claim           | Usage                                        |
| --------------- | -------------------------------------------- |
| User.Read       | Sign in and reading basic user properties    |
| profile         | Reading user info (name, picture, user name) |
| email           | Reading user info (email address)            |
| openid          | Sign in / authentication                     |
| offline\_access | Keep persisting data per user                |

You can read more about MS Graph permissions here.

## RealmJoin Portal - Core Features

Application ID: `61fcb903-2868-4c54-91cd-2716c62c5007`

Admins and Users do not directly interact with this app. It represents RealmJoin’s backend that interacts with Azure AD and Intune.

All actions triggered by this app are filtered through RealmJoin’s internal permission (RBAC) model which can evaluate AzureAD group and role memberships.

All of the following permissions are of the permission type “**Application**” ( = can operate without a signed in user) and target [MS Graph API](https://docs.microsoft.com/en-us/graph/api/overview?view=graph-rest-1.0). You can read more about the individual permissions [here](https://docs.microsoft.com/en-us/graph/permissions-reference).

If you onboard **RealmJoin Core Features (Read-Only)** features it will onboard read-only versions of the same permissions and offer only limited functionality. This can be used to testdrive RealmJoin Portal with less permissions. See [below](required-permissions.md#realmjoin-portal-core-features-1) for details.

### API Permissions

| Claim                                                   | Usage                                                                  |
| ------------------------------------------------------- | ---------------------------------------------------------------------- |
| PrivilegedAccess.Read.AzureAD                           | Read AzureAD roles (incl. PIM) for RealmJoin’s internal RBAC model     |
| PrivilegedAccess.Read.AzureResources                    | Read AzureAD roles (incl. PIM) for RealmJoin’s internal RBAC model     |
| PrivilegedAccess.Read.AzureADGroup                      | Read AzureAD groups (incl. PIM) for RealmJoin’s internal RBAC model    |
| User.ReadWrite.All                                      | List / display users as well as user self-services                     |
| Device.ReadWrite.All                                    | Interact with devices and device management                            |
| Group.ReadWrite.All                                     | List / display groups as well as application group management          |
| GroupMember.ReadWrite.All                               | Manage application assignment group memberships                        |
| AuditLog.Read.All                                       | Read last signin date of users and devices                             |
| DeviceManagementServiceConfig.ReadWrite.All             | Manage / automate software deployment and device management via Intune |
| DeviceManagementManagedDevices.PrivilegedOperations.All | Trigger device management tasks like "Scan Device"                     |
| DeviceManagementManagedDevices.ReadWrite.All            | Manage / automate software deployment and device management via Intune |
| DeviceManagementApps.ReadWrite.All                      | Manage / automate software deployment via Intune                       |
| DeviceManagementRBAC.ReadWrite.All                      | Manage / automate software deployment and device management via Intune |

## RealmJoin Portal - Core Features (Read-Only)

Application ID: `ba1ffde4-2f5e-46e2-a431-a9a19f77aed4`

Admins and Users do not directly interact with this app. It represents RealmJoin’s backend that interacts with Azure AD and Intune.

Using this app only allows you to do "read only" operations on AzureAD/MS Graph and Intune with RealJoin Portal. This is intended for testing RealmJoin Portal as part of a PoC before switching over to the full set of [Core Features](required-permissions.md#realmjoin-portal-core-features). Using this app severly limits your ability to deploy or manage applications as it cannot create or modify AzureAD groups or Intune applications.

Be aware, using this app does not stop you from leveraging components like [runbooks ](../../runbooks/)that can be configured for writing (and possibly destructive) operations.

All actions triggered by this app are filtered through RealmJoin’s internal permission (RBAC) model which can evaluate AzureAD group and role memberships.

All of the following permissions are of the permission type “**Application**” ( = can operate without a signed in user) and target [MS Graph API](https://docs.microsoft.com/en-us/graph/api/overview?view=graph-rest-1.0). You can read more about the individual permissions [here](https://docs.microsoft.com/en-us/graph/permissions-reference).

### API Permissions

| Claim                                   | Usage                                                               |
| --------------------------------------- | ------------------------------------------------------------------- |
| PrivilegedAccess.Read.AzureAD           | Read AzureAD roles (incl. PIM) for RealmJoin’s internal RBAC model  |
| PrivilegedAccess.Read.AzureResources    | Read AzureAD roles (incl. PIM) for RealmJoin’s internal RBAC model  |
| PrivilegedAccess.Read.AzureADGroup      | Read AzureAD groups (incl. PIM) for RealmJoin’s internal RBAC model |
| User.Read.All                           | List / display users                                                |
| Device.Read.All                         | Interact with devices and device management                         |
| Group.Read.All                          | List / display groups as                                            |
| GroupMember.Read.All                    | List application assignment group memberships                       |
| AuditLog.Read.All                       | Read last signin date of users and devices                          |
| DeviceManagementServiceConfig.Read.All  | Read software deployment and device management via Intune           |
| DeviceManagementManagedDevices.Read.All | Read software deployment and device management via Intune           |
| DeviceManagementApps.Read.All           | Read software deployment via Intune                                 |
| DeviceManagementRBAC.Read.All           | Read software deployment and device management via Intune           |
