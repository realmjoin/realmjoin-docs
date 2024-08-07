# Permission

## Permissions

You can delegate access to different levels of functionality of RealmJoin Portal to different users based in Entra group- or role membership.&#x20;

To delegate/limit which runbooks can be used by different operators, please see [Runbook Permissions](../automation/runbooks/runbook-permissions.md) - which is not covered here.

If these predefined roles do not meet your requirements, you can request [Custom Roles](custom-roles/) to be enabled for your environment to create additional, granular roles.

### Admin Permissions

This will grant full administrative and configuration control over RealmJoin Portal. This includes:

* Access to all features of [User, Group and Device Management](../ugd-management/user-group-device-management.md) and [Process Automation](../automation/runbooks/)
* Access to all features of [Application Management](broken-reference)
* Full access to [Settings](settings.md) including:
  * Modifying permissions / delegations
  * Onboarding/modifying Runbook integration
  * Modifying Runbooks permissions and customizing
  * Changing package automation defaults

### Auditor Permissions

This will grant read-only access to all areas of RealmJoin Portal.&#x20;

* Read-only access to all areas of [User, Group and Device Management](../ugd-management/user-group-device-management.md)&#x20;
* Read-only access to all features of [Application Management](broken-reference)
* Reading Runbook Job logs

This permission does not include

* Starting Runbooks&#x20;
* Subscribing to apps/packages
* Modifying group memberships / assignments
* Access to [Settings](settings.md)

### Supporter Permissions

This will grant:

* Read-only access to all areas of [User, Group and Device Management](../ugd-management/user-group-device-management.md)&#x20;
* Additionally allows to initiate AnyDesk sessions and create LAPS accounts

This permission does not include

* Subscribing to apps/packages
* Modifying group memberships / assignments
* Access to [Settings](settings.md)
* Starting Runbooks or Read Runbook Job logs

### Runbook Runner Permissions

This will grant:

* Read-only access to all areas of [User, Group and Device Management](../ugd-management/user-group-device-management.md)&#x20;
* Starting Runbooks&#x20;
* Reading Runbook Job logs

This permission does not include

* Subscribing to apps/packages
* Modifying group memberships / assignments
* Access to [Settings](settings.md)

This is the recommended permission to use for User/Device Supporter Roles.

### Software Agent Permissions

This will grant:

* Read-only access to [User and Group Management](../ugd-management/user-group-device-management.md)
  * Full access on application management groups
* Access to all features of [Application Management](broken-reference)

This permission does not include

* Starting Runbooks&#x20;
* Modifying group memberships / assignments other than through application management
* [Device Management](../ugd-management/user-list/)
* Access to [Settings](settings.md)

### Software Requester Permissions

This allows a user to file a request to RealmJoin for a new software package to be created and offered in his organization / tenant.

Regular software requests will be processed by the "package as a service" team at RealmJoin.

This permission does not include

* Access to [User, Group and Device Management](../ugd-management/user-group-device-management.md)&#x20;
* Access to [Application Management](broken-reference)
* Starting Runbooks or reading Runbook Job logs
* Access to [Settings](settings.md)

### Organic Software Requester Permissions

This allows a user to automatically create a software package from uploaded sources in his organization / tenant.

No manual check by the "package as a service" team at RealmJoin will be done on these packages.

This permission does not include

* Access to [User, Group and Device Management](../ugd-management/user-group-device-management.md)&#x20;
* Access to [Application Management](broken-reference)
* Starting Runbooks or reading Runbook Job logs
* Access to [Settings](settings.md)

## Permission Defaults

Normal users will by default only have access to the [About Me](../ugd-management/about-me.md) page to support self-service scenarios.

On initial onboarding, The AzureAD role "Global Admins" is also a RealmJoin Admin, so that initial configuration is possible.&#x20;
