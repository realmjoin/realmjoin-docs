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

If you onboard **RealmJoin Core ReadOnly** features it will onboard read-only versions of the same permissions and offer only limited functionality. These are not described separately.

### API Permissions

| Claim                                                   | Usage                                                                  |
| ------------------------------------------------------- | ---------------------------------------------------------------------- |
| PrivilegedAccess.Read.AzureAD                           | Read AzureAD roles (incl. PIM) for RealmJoin’s internal RBAC model     |
| PrivilegedAccess.Read.AzureResources                    | Read AzureAD roles (incl. PIM) for RealmJoin’s internal RBAC model     |
| PrivilegedAccess.Read.AzureADGroup                      | Read AzureAD groups (incl. PIM) for RealmJoin’s internal RBAC model    |
| User.ReadWrite.All                                      | List / display users as well as user self-services                     |
| Group.ReadWrite.All                                     | List / display groups as well as application group management          |
| Device.ReadWrite.All                                    | Interact with devices and device management                            |
| GroupMember.ReadWrite.All                               | Manage application assignment group memberships                        |
| AuditLog.Read.All                                       | Read last signin date of users and devices                             |
| DeviceManagementServiceConfig.ReadWrite.All             | Manage / automate software deployment and device management via Intune |
| DeviceManagementManagedDevices.PrivilegedOperations.All | Trigger device management tasks like "Scan Device"                     |
| DeviceManagementApps.ReadWrite.All                      | Manage / automate software deployment and device management via Intune |
| DeviceManagementRBAC.ReadWrite.All                      | Manage / automate software deployment and device management via Intune |
