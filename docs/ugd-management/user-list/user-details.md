# User Details

This page will show you detailed information about a single user object.&#x20;

### User Summary

![](<../../../.gitbook/assets/image (173).png>)

### Status information

The User Summary include some glanceable information about the status of a user object:

* **Enabled** - The user is not blocked from sign in
* **Member** - The user is a native user in this tenant/organization
* **Guest** - This is an external user from a different organization
* **DE/US**... - Two letter code designating the user's [usage location](https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/licensing-groups-resolve-problems#usage-location-isnt-allowed) which is relevant for licensing.
* ![](<../../../.gitbook/assets/image (166).png>) - Object creation date
* ![](<../../../.gitbook/assets/image (245).png>) - Last sign-in activity

### Overview Tab

Main tab, showing you a host on information about the user, including owned devices and group memberships.

### Runbooks Tab

If you have been given Supporter or Admin-Permissions, this gives you access to runbooks that can be executed on this user object. For example to change an email-address for a user.

See[ Process Automation](../../automation/runbooks/) for more information.

### Settings Tab

You can assign Key-Value pairs of data to specific users to control RealmJoin Clients behavior for this user.

Most of the time this is used to overwrite settings configure on a group or for all users.&#x20;

<figure><img src="../../../.gitbook/assets/image (95).png" alt=""><figcaption><p>Settings overview on a user</p></figcaption></figure>

You can add a setting assigned to this user using <img src="../../../.gitbook/assets/image (66).png" alt="" data-size="line">, alternatively open an existing setting by clicking on its name/key or search for a setting by name/key.

Clicking a name/key will open a UI allowing you to manipulate/create the setting.&#x20;

<figure><img src="../../../.gitbook/assets/image (109).png" alt=""><figcaption><p>Setting editor</p></figcaption></figure>

Be aware: The value of the setting must be valid JSON, which includes singular values like `true` or strings (without brackets).

The switches in the lower half of the wizard allow scoping this setting to certain scenarios like VDI / Windows365 machines.

Please see [Available Settings](../user-and-group-settings/additional-settings.md) for more information on which settings can be used.

### Other Tabs

* Raw [data sources](../user-group-device-management.md#data-sources), like Entra ID, Sign in logs etc display in JSON. Only available for RealmJoin administrators.
