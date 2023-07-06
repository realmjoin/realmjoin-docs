# User List

This view offers you a simple way to search or review users in your environment.

<figure><img src="../../.gitbook/assets/image (10) (1).png" alt=""><figcaption><p>User List</p></figcaption></figure>

### User Object Types

"Users" includes:

* AzureAD user objects
* AzureAD external users, a.k.a. guests
* Shared mailboxes
* Room and Equipment mailboxes
* Administrative user accounts



### Search and Sort

The user list allows you to search for any user in your organization by

* DisplayName
* User Principal Name
* AzureAD Object ID
* Job Title
* City
* Country

The search supports realtime / as-you-type incremental search. The search results will update instantly as you type.

You can sort the current search result or the full list by any of the fields, by clicking on the field's name.

### Filters

<figure><img src="../../.gitbook/assets/image (8) (3).png" alt=""><figcaption><p>Filters</p></figcaption></figure>

You can use the filters above the list to limit search results to specific objects:

#### **Usertype**

* **Members** - Users native to your tenant (default)
* **Guests** - Azure B2B Guests invited from other tenants&#x20;
* **Any** - Both, Members and Guests are displayed&#x20;

#### ADM Accounts

* **Any** - Display Admin- and regular user accounts (default)
* **ADM** - Filter to only show users whose DisplayName starts with "ADM" (admin accounts)
* **Non-ADM** - Negation of the "ADM" Filter

#### Data completeness

* **Any** - Show users with both complete and missing data (default)
* **No Data** - Show only users with missing data in "job title", "city" or "country"

### Drill Down to a User

Clicking the name of a user object will lead you to this [user's details page](user-details.md).

