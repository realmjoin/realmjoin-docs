# Required Permissions

RealmJoin Portal consists of multiple apps which are used for different use cases.

## RealmJoin Portal

Application ID: `b0130885-16be-4c6f-83de-5b1042b5d2e3`

Users interact with this app for self services. Admins use this app to interact with all RealmJoin Portal features. This includes onboarding the "Core Features" permissions (see below).&#x20;

All of the following permissions are of the permission type “**Delegated**” ( = can only operate when a user is interactively signed in). Also this app can be **consented per User** ( = admin consent is optional)

These permissions allow a basic functionality of the app per user that consents to these permissions.

### RealmJoin Portal - Core Features <a href="#b31d828b-8bcb-45fc-8d72-5418777a530b" id="b31d828b-8bcb-45fc-8d72-5418777a530b"></a>

Application ID: `61fcb903-2868-4c54-91cd-2716c62c5007`

Admins and Users do not directly interact with this app. It represents RealmJoin’s backend that interacts with Azure AD and Intune.

All actions triggered by this app are filtered through RealmJoin’s internal permission (RBAC) model which can evaluate AzureAD group and role memberships.

All of the following permissions are of the permission type “**Application**” ( = can operate without a signed in user)

If you onboard **RealmJoin Core ReadOnly** features it will onboard read-only versions of the same permissions and offer only limited functionality. These are not described separately.

