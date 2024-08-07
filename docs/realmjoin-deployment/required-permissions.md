# Required Permissions

RealmJoin Portal consists of multiple apps which are used for different use cases.

The following listed permissions are currently not requested by the portal. Adjustments may be needed to represent this least privilege set here. This will be fixed in a future portal release.&#x20;

## RealmJoin Portal

Application ID: `b0130885-16be-4c6f-83de-5b1042b5d2e3`

Users interact with this app for self-service. Admins use this app to interact with all RealmJoin Portal features. This includes onboarding the [Core Features permissions](required-permissions.md#api-permissions-1).

All the following permissions are of the permission type “**Delegated**” ( = can only operate when a user is interactively signed in). Also, this app can be **consented per User** ( = admin consent is optional).

All the following permissions target [MS Graph API](https://docs.microsoft.com/en-us/graph/api/overview?view=graph-rest-1.0). You can read more about the individual permissions [here](https://docs.microsoft.com/en-us/graph/permissions-reference).

These permissions are required for basic functionality of the app per user.

### API Permissions

The following permissions are from type "Delegated" and are mainly used for login to the Portal.

| Claim           | Usage                                       |
| --------------- | ------------------------------------------- |
| User.Read       | Sign in and reading basic user properties   |
| profile         | Reading user info (name, picture, username) |
| email           | Reading user info (email address)           |
| openid          | Sign in / authentication                    |
| offline\_access | Keep persisting data per user               |

You can read more about MS Graph permissions here.

## RealmJoin Portal - Core Features

Application ID: `61fcb903-2868-4c54-91cd-2716c62c5007`

Admins and Users do not directly interact with this app. It represents RealmJoin’s backend that interacts with Entra ID and Intune.

All actions triggered by this app are filtered through RealmJoin’s internal permission (RBAC) model which can evaluate Entra group and role memberships.

All the following permissions are of the permission type “**Application**” ( = can operate without a signed in user) and target [MS Graph API](https://docs.microsoft.com/en-us/graph/api/overview?view=graph-rest-1.0). You can read more about the individual permissions [here](https://docs.microsoft.com/en-us/graph/permissions-reference).

If you onboard **RealmJoin Core Features (Read-Only)** features, it will onboard read-only versions of the same permissions and offer only limited functionality. This can be used to test-drive RealmJoin Portal with less permissions. See [below](required-permissions.md#realmjoin-portal-core-features-1) for details.

### API Permissions

The following table reflects the permissions (type Application permissions) if Administrative Units (AU) **are not used**. Some of the permissions are optional, please refer to your onboarding agent to adopt the consent to your needs.

| Claim                                                   | Usage                                                                  |
| ------------------------------------------------------- | ---------------------------------------------------------------------- |
| User.Read.All                                           | List / display users as well as user self-services                     |
| Device.Read.All                                         | Interact with devices and device management                            |
| Group.ReadWrite.All                                     | List / display groups as well as application group management          |
| GroupMember.ReadWrite.All                               | Manage application assignment group memberships                        |
| AuditLog.Read.All                                       | Read last sign-in date of users and devices                            |
| DeviceManagementServiceConfig.Read.All                  | Manage / automate software deployment and device management via Intune |
| DeviceManagementManagedDevices.PrivilegedOperations.All | Trigger device management tasks like "Scan Device"                     |
| DeviceManagementManagedDevices.Read.All                 | Manage / automate software deployment and device management via Intune |
| DeviceManagementConfiguration.ReadWrite.All             | Manage Device Health Scripts                                           |
| DeviceManagementApps.ReadWrite.All                      | Manage / automate software deployment via Intune                       |
| AdministrativeUnit.Read.All (optional)                  | Needed when AU are used.                                               |

### RealmJoin Portal - Security Features&#x20;

Application ID: `5713826-15ee-4f6c-91ee-56cb1844e275`

This app is responsible for advanced security information in the ReamJoin Portal. Please refer to your onboarding agent to adopt the consent to your needs.

### RealmJoin

Application ID: `008c704d-20fe-4c15-bab0-c2e6f66a992c`

This app is responsible for the client application (RealmJoin Agent) (type Delegated permission) and the classic portal (type Application permission). Please refer to your onboarding agent to adopt the consent to your needs.

### API Permissions

| Claim                 | Usage                                                                         |
| --------------------- | ----------------------------------------------------------------------------- |
| User.Read (Delegated) | Client Application: Used by RealmJoin Agent                                   |
| User.Read.All         | Classic Portal: List / display users                                          |
| Device.Read.All       | Classic Portal: Interact with devices and device management                   |
| Group.Read.All        | Classic Portal: List / display groups as well as application group management |

