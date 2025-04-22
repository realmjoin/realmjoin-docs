# Pre-defined Roles

## Usage

All **pre-defined roles** can be **assigned** to **one or multiple Entra groups**. If wanted, you can manage those groups via Microsoft Entra Privileged Identity Management (e.g. implement just-in-time privileged access with approval mechanisms).

Simply click on "\[x] groups" and add or remove the desired Entra groups.

<figure><img src="../../.gitbook/assets/image (30).png" alt=""><figcaption></figcaption></figure>

## Available roles

### Admin Permissions

This will grant **full administrative and configuration control** over RealmJoin Portal. This includes e.g.:

* Access to all features of [User, Group and Device Management](../../ugd-management/user-group-device-management.md) and [Process Automation](../../automation/runbooks/)
* Access to all features of [Application Management](broken-reference)
* Full access to [Settings](../settings.md) including:
  * Modifying permissions / delegations
  * Onboarding/modifying Runbook integration
  * Modifying Runbooks permissions and customizing
  * Changing package automation defaults
* Retrieval of LAPS credentials
* Manage Workplace Cloud Storage

### Auditor Permissions

This will grant read-only access to all areas of RealmJoin Portal.&#x20;

* Read-only access to all areas of [User, Group and Device Management](../../ugd-management/user-group-device-management.md)&#x20;
* Read-only access to all features of [Application Management](broken-reference)
* Reading Runbook Job logs

This permission does not include:

* Starting Runbooks&#x20;
* Subscribing to apps/packages
* Modifying group memberships / assignments
* Access to [Settings](../settings.md)
* Retrieval of LAPS credentials

{% hint style="info" %}
If you combine Auditor with roles from down below, retrieval of LAPS credentials will not be possible.
{% endhint %}

### Supporter Permissions

This will grant:

* Read-only access to all areas of [User, Group and Device Management](../../ugd-management/user-group-device-management.md)&#x20;
* Initiate remote support sessions
* Retrieval of LAPS credentials
* Sync/scan device
* Request device logs

This permission does not include:

* Subscribing to apps/packages
* Modifying group memberships / assignments
* Access to [Settings](../settings.md)
* Starting Runbooks or Read Runbook Job logs

### Runbook Runner Permissions

This will grant:

* Read-only access to all areas of [User, Group and Device Management](../../ugd-management/user-group-device-management.md)&#x20;
* Starting Runbooks&#x20;
* Reading Runbook Job logs

This permission does not include:

* Subscribing to apps/packages
* Modifying group memberships / assignments
* Access to [Settings](../settings.md)

### Software Agent Permissions

This will grant:

* Read-only access to [User and Group Management](../../ugd-management/user-group-device-management.md)
  * Full access on application management groups
* Access to all features of [Application Management](broken-reference)

This permission does not include:

* Starting Runbooks&#x20;
* Modifying group memberships / assignments other than through application management
* [Device Management](../../ugd-management/user-list/)
* Access to [Settings](../settings.md)

### Software Requester Permissions

This allows a user to file a request to RealmJoin for a new software package to be created and offered in his organization / tenant. Regular software requests will be processed by the "package as a service" team at RealmJoin.

This permission does not include:

* Access to [User, Group and Device Management](../../ugd-management/user-group-device-management.md)&#x20;
* Access to [Application Management](broken-reference)
* Starting Runbooks or reading Runbook Job logs
* Access to [Settings](../settings.md)

### Organic Software Requester Permissions

This allows a user to automatically create a software package from uploaded sources in his organization / tenant. No manual check by the "package as a service" team at RealmJoin will be done on these packages.

This permission does not include:

* Access to [User, Group and Device Management](../../ugd-management/user-group-device-management.md)&#x20;
* Access to [Application Management](broken-reference)
* Starting Runbooks or reading Runbook Job logs
* Access to [Settings](../settings.md)

### Notification Agent Permissions

This allows a user to create and publish notifications.

This permission does not include:

* Access to [User, Group and Device Management](../../ugd-management/user-group-device-management.md)&#x20;
* Access to [Application Management](broken-reference)
* Starting Runbooks or reading Runbook Job logs
* Access to [Settings](../settings.md)
