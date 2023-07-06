# Group List

This view offers you a simple way to search or review groups in your environment.

<figure><img src="../../.gitbook/assets/image (1) (2).png" alt=""><figcaption><p>Group List</p></figcaption></figure>

### Object Types

The category "groups" includes:

* AzureAD static and dynamic groups
* Exchange Online mail-enabled groups and distribution groups
* Microsoft Office365 groups and teams

### Search and Sort

The group list allows you to search for any AzureAD or Exchange Online groups in your organization by

* Name
* AzureAD Object ID
* AzureAD Group Type

The search supports realtime / as-you-type incremental search. The search results will update instantly as you type.

You can sort the current search result or the full list by any of the fields, by clicking on the field's name.

### Filters

<figure><img src="../../.gitbook/assets/image (3) (1).png" alt=""><figcaption><p>Group Filters</p></figcaption></figure>

You can use the filters above the list to limit the search results to specific objects:

#### Only RealmJoin Groups

Turn this toggle **off** to include groups that do not match any RealmJoin naming scheme. When **off** all AzureAD groups will be shown.

By default (**on**), RealmJoin only lists groups related to RealmJoin's operation, like&#x20;

* Licensing Groups ("lic -")
* Application-Assignment Groups ("app -")
* Configuration/Permission Groups ("cfg -")

#### Static/Dynamic

Limit the groups shown to&#x20;

* **Static** - Groups with static member assignment
* **Dynamic** - Groups with dynamic membership
* **Any** - All groups (default)

#### Security/Unified

Limit the search results to the type of AzureAD group

* **Security** - List Security Groups. This currently also includes Exchange-related groups like Distribution Lists and mail-enabled Security Groups.
* **Unified** - List Microsoft 365 groups/teams as well as RealmJoin internal groups like "RealmJoin - All Users"

### Drill down to a Group

Clicking the name of a group object will lead you to this [user's details page](../user-list/user-details.md).
