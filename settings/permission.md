# Permission

## Permissions

You can delegate access to different levels of functionality of RealmJoin Portal to different users based in AzureAD group- or role membership.&#x20;

To delegate/limit which runbooks can be used by different operators, please see [Runbook Permissions](../runbooks/runbook-permissions.md) - which is not covered here.

There are different levels/roles that can be granted on this page:

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

### Supporter Permissions

This will grant:

* Read-only access to all areas of [User, Group and Device Management](../user-group-device-management/)&#x20;

This permissions does not include

* Subscribing to apps/packages
* Modifying group memberships / assignments
* Access to [Settings](./)
* Starting Runbooks or Read Runbook Job logs

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

### Software Agent Permissions

This will grant:

* Read-only access to [User and Group Management](../user-group-device-management/)
  * Full access on application managent groups
* Access to all features of [Application Management](../AppManagement/)

This permissions does not include

* Starting Runbooks&#x20;
* Modifying group memberships / assignments other than through application manangent
* [Device Management](../user-group-device-management/device-list/)
* Access to [Settings](./)

### Software Requester Permissions

This allows a user to file a request to glueckkanja GAB for a new  software package to be created and offered in his organization / tenant.

Regular software requests will be processed by the "package as a service" team at glueckkanja GAB.

This permission does not include

* Access to [User, Group and Device Management](../user-group-device-management/)&#x20;
* Access to [Application Management](../AppManagement/)
* Starting Runbooks or reading Runbook Job logs
* Access to [Settings](./)

### Organic Software Requester Permissions

This allows a user to automatically create a software package from uploaded sources in his organization / tenant.

No manual check by the "package as a service" team at glueckkanja GAB will be done on these packages.

This permission does not include

* Access to [User, Group and Device Management](../user-group-device-management/)&#x20;
* Access to [Application Management](../AppManagement/)
* Starting Runbooks or reading Runbook Job logs
* Access to [Settings](./)

## Permission Defaults

Normal users will by default only have access to the [About Me](../user-group-device-management/about-me.md) page to support self-service scenarios.

On initial onboarding, The AzureAD role "Global Admins" is also a RealmJoin Admin, so that initial configuration is possible.&#x20;
