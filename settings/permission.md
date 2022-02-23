# Permission

## Permissions

You can delegate access to different levels of functionality of RealmJoin Portal to different users based in AzureAD group- or role membership.&#x20;

There are different levels/roles that can be granted:

### Admin Permissions

This will grant full administrative and configuration control over RealmJoin Portal. This includes:

* Access to all features of [User, Group and Device Management](../user-group-device-management/) and [Process Automation](../runbooks/)
* Access to all features of [Application Management](../AppManagement/)
* Full access to [Settings](./), incl.
  * Modifying permissions / delegations
  * Onboarding/modifying Runbook integration
  * Modifying Runbooks permissions and customizing
  * Changing package automation defaults

### Auditor Permissions

This will grant read-only access to all areas of RealmJoin Portal.&#x20;

* Read-only access to all areas of [User, Group and Device Management](../user-group-device-management/)&#x20;
* Read-only access to all features of [Application Management](../AppManagement/)
* Reading Runbook Job logs

This permissions does not include

* Starting Runbooks&#x20;
* Subscribing to apps/packages
* Modifying group memberships / assignments
* Access to [Settings](./)

### Runbook Runner Permissions

This will grant:

* Read-only access to all areas of [User, Group and Device Management](../user-group-device-management/)&#x20;
* Starting Runbooks&#x20;
* Reading Runbook Job logs

This permissions does not include

* Subscribing to apps/packages
* Modifying group memberships / assignments
* Access to [Settings](./)

This is the recommended permission to use for User/Device Supporter Roles.

## Permission Defaults

Normal users will be default only have access to the [About Me](../user-group-device-management/about-me.md) page to support self-service scenarios.

On initial onboarding, The AzureAD role "Global Admins" is also a RealmJoin Admin, so that initial configuration is possible.&#x20;
