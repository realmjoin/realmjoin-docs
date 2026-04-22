# Required Permissions

RealmJoin Portal consists of multiple apps which are used for different use cases.

## RealmJoin Portal

Application ID: `b0130885-16be-4c6f-83de-5b1042b5d2e3`

Users interact with this app for self-service. Admins use this app to interact with all RealmJoin Portal features.

All the following permissions are of the permission type “**Delegated**” ( = can only operate when a user is interactively signed in). Also, this app can be **consented per User** ( = admin consent is optional).

These permissions are required for basic functionality of the app per user.

### API Permissions

The following permissions are from type "Delegated" and are mainly used for login to the Portal.

| Claim            | Usage                                       |
| ---------------- | ------------------------------------------- |
| `User.Read`      | Sign in and reading basic user properties   |
| `profile`        | Reading user info (name, picture, username) |
| `email`          | Reading user info (email address)           |
| `openid`         | Sign in / authentication                    |
| `offline_access` | Keep persisting data per user               |

{% hint style="info" %}
Depending on the way you onboarded your tenant, you may find the "RealmJoin Portal - Core Features" permissions from below inside the "RealmJoin Portal" Application or in the separate one described below.&#x20;
{% endhint %}

The following table reflects the permissions (type Application permissions) if Administrative Units (AU) **are not used**.&#x20;

Some of the permissions are needed for optional features, please refer to your onboarding agent to adopt the consent to your needs.

| Claim                                                   | Permission                                                        |
| ------------------------------------------------------- | ----------------------------------------------------------------- |
| AuditLog.Read.All                                       | Read all audit log data                                           |
| BitlockerKey.Read.All                                   | Read all BitLocker keys                                           |
| Device.Read.All                                         | Read all devices                                                  |
| DeviceLocalCredential.Read.All                          | Read device local credential passwords                            |
| DeviceManagementApps.ReadWrite.All                      | Read and write Microsoft Intune apps                              |
| DeviceManagementConfiguration.Read.All                  | Read Microsoft Intune device configuration and policies           |
| DeviceManagementManagedDevices.PrivilegedOperations.All | Perform user-impacting remote actions on Microsoft Intune devices |
| DeviceManagementManagedDevices.Read.All                 | Read Microsoft Intune devices                                     |
| DeviceManagementScripts.ReadWrite.All                   | Read and write Microsoft Intune Scripts                           |
| DeviceManagementServiceConfig.Read.All                  | Read Microsoft Intune configuration                               |
| Group.ReadWrite.All                                     | Read and write all groups                                         |
| GroupMember.ReadWrite.All                               | Read and write all group memberships                              |
| User.Read.All                                           | Read all users' full profiles                                     |
| WindowsUpdates.ReadWrite.All                            | Read and write all Windows update deployment settings             |
| AdministrativeUnit.Read.All (optional)                  | Read all administrative units                                     |

## RealmJoin Portal - Core Features

Application ID: `61fcb903-2868-4c54-91cd-2716c62c5007`

Admins and Users do not directly interact with this app. It represents RealmJoin’s backend that interacts with Entra ID and Intune.

All actions triggered by this app are filtered through RealmJoin’s internal permission (RBAC) model which can evaluate Entra group and role memberships.

All the following permissions are of the permission type “**Application**” ( = can operate without a signed in user) and target [MS Graph API](https://docs.microsoft.com/en-us/graph/api/overview?view=graph-rest-1.0). You can read more about the individual permissions [here](https://docs.microsoft.com/en-us/graph/permissions-reference).

### API Permissions

The following table reflects the permissions (type Application permissions) if Administrative Units (AU) **are not used**.&#x20;

Some of the permissions are needed for optional features, please refer to your onboarding agent to adopt the consent to your needs.

| Claim                                                   | Permission                                                        |
| ------------------------------------------------------- | ----------------------------------------------------------------- |
| AuditLog.Read.All                                       | Read all audit log data                                           |
| BitlockerKey.Read.All                                   | Read all BitLocker keys                                           |
| Device.Read.All                                         | Read all devices                                                  |
| DeviceLocalCredential.Read.All                          | Read device local credential passwords                            |
| DeviceManagementApps.ReadWrite.All                      | Read and write Microsoft Intune apps                              |
| DeviceManagementConfiguration.Read.All                  | Read Microsoft Intune device configuration and policies           |
| DeviceManagementManagedDevices.PrivilegedOperations.All | Perform user-impacting remote actions on Microsoft Intune devices |
| DeviceManagementManagedDevices.Read.All                 | Read Microsoft Intune devices                                     |
| DeviceManagementScripts.ReadWrite.All                   | Read and write Microsoft Intune Scripts                           |
| DeviceManagementServiceConfig.Read.All                  | Read Microsoft Intune configuration                               |
| Group.ReadWrite.All                                     | Read and write all groups                                         |
| GroupMember.ReadWrite.All                               | Read and write all group memberships                              |
| User.Read.All                                           | Read all users' full profiles                                     |
| WindowsUpdates.ReadWrite.All                            | Read and write all Windows update deployment settings             |
| AdministrativeUnit.Read.All (optional)                  | Read all administrative units                                     |

## RealmJoin Portal - Security Features&#x20;

Application ID: `e5713826-15ee-4f6c-91ee-56cb1844e275`

This app is responsible for advanced security information in the ReamJoin Portal. Please refer to your onboarding agent to adopt the consent to your needs.

All of the following permissions use the `WindowsDefenderATP` API.

### API Permissions

| Claim                           | Permission                                                         |
| ------------------------------- | ------------------------------------------------------------------ |
| AdvancedQuery.Read.All          | Run advanced queries                                               |
| Alert.Read.All                  | Read all alerts                                                    |
| File.Read.All                   | Read file profiles                                                 |
| Ip.Read.All                     | Read IP address profiles                                           |
| Machine.Read.All                | Read all machine profiles                                          |
| Score.Read.All                  | Read Threat and Vulnerability Management score                     |
| SecurityConfiguration.Read.All  | Read all security configurations                                   |
| SecurityRecommendation.Read.All | Read Threat and Vulnerability Management security recommendations  |
| Software.Read.All               | Read Threat and Vulnerability Management software information      |
| Ti.Read.All                     | Read all IOCs                                                      |
| Url.Read.All                    | Read URL profiles                                                  |
| User.Read.All                   | Read user profiles                                                 |
| Vulnerability.Read.All          | Read Threat and Vulnerability Management vulnerability information |

## RealmJoin Agent

Application ID: `008c704d-20fe-4c15-bab0-c2e6f66a992c`

This app is responsible for the client application (RealmJoin Agent).&#x20;

Please refer to your onboarding agent to adopt the consent to your needs.

### API Permissions

| Claim           | Permission                    |
| --------------- | ----------------------------- |
| Device.Read.All | Read all devices              |
| Group.Read.All  | Read all groups               |
| User.Read       | Sign in and read user profile |
| User.Read.All   | Read all users' full profiles |
