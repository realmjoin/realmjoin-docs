---
description: First pointers for the migration to the new RealmJoin portal.
---

# Migration to RealmJoin vNext

After 8+ years, glueckkanja AG updated the RealmJoin portal to a new version, vNext, which is described in this documentation. The documentation for the outdated [Classic portal](https://docs-classic.realmjoin.com) can still be reached.  The Classic portal will be outphased end of Q3 2024. For requirements, permissions and onboarding of the vNext portal, check the sections above.&#x20;

## Technical changes in the backend

With the move to the new portal, we introduce an updated way of management and data collection.

### No Sync

In RealmJoin vNext, we move from a sync of all related (user-/device-/) data into our data base to a _live_ view using the Graph API. This impacts as follows:&#x20;

* No _RealmJoin All Users_ group: As this is a virtual group created by RealmJoin based on synced data, it will not be available anymore. We suggest using a dynamic group based on licensing to substitute, if the _RealmJoin All User_ group was used. As it is highly suggested to assign all application packages to dedicated or in-tenant groups, the expected impact to processes is low.&#x20;
* No sync delay: Users and devices should be manageable in vNext faster compared to the Classic portal. Also, deleted objects will not remain in groups and similar.
* Conflict in sync filters and permissions: The vNext portal allows RealmJoin administrators to configure permissions and group filters directly without any interaction with RealmJoin support staff. As long as there are conflicting configurations, the Classic filters as provided in the RealmJoin data base are prioritized.&#x20;

{% hint style="info" %}
To deactivate the sync and change to the new plan as well as move to vNext permissions, please open a ticket via support@realmjoin.com&#x20;
{% endhint %}

## Processual changes

The configuration and assignment of application packages and RealmJoin settings are stored in our data base. As the new vNext portal utilizes the same data base as the Classic portal, data will remain and vNext is mainly a UI change, which might lead to a required adaption of existing process.&#x20;

### Package handling

In general, it is possible to keep using the same package handling as before, but we recommend using the additional features.&#x20;

* Intunewin vs RealmJoin agent: With vNext, all applications are also available to be deployed via Intune. We highly recommend not to mix up both deployment options, and recommend staying with the RealmJoin agent driven deployment as it offers more features. For details see [package types](../app-management/packages/package-store/#package-types).&#x20;
* Basic vs managed: Packages can be subscribed as _managed_ or _basic_ subscriptions. _Basic_ subscriptions are similar to subscriptions in the RealmJoin Classic portal, while _managed_ subscriptions offer more features and a full automated lifecycle. As the latter are optional, we highly recommend to subscribe all packages as _managed_.&#x20;
* Multiple configurations: As managed subscriptions create and handle the related assignment groups, having multiple configurations of the same package is handled differently to basic subscriptions. Instead of assigning the package to N groups with varying configurations, the package is subscribed N times. Please also change the package name during the first subscription step, to allow clearer management. E.g.: Instead of one package _Adobe Reader_ which is assigned to the groups _Adobe Reader EN_ and _Adobe Reader DE_ with corresponding configurations, we suggest to subscribe and rename to have a package _Adobe Reader EN_ and one package _Adobe Reader DE._ With the automation features, the maintenance is not increasing significantly.&#x20;
* User or device assignment: In vNext, RealmJoin features user or device group assignment. We recommend not to mix those and use device groups for classic _DEM_ scenarios.

Please see the [package deployment](../app-management/packages/package-management/package-deployment.md) section in the documentation for more details.

{% hint style="info" %}
Note: Intunewin deployment options might not be available from the start and need to be activated by glueckkanja, based on the licensing model.
{% endhint %}

