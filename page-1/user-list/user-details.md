# User Details

![](<../../.gitbook/assets/image (5) (1).png>)

### User Object Types

This page will show you detailed information about a single user object. The category "user object" also includes:

* Shared mailboxes
* Room and Equipment mailboxes
* Administrative users
* AzureAD external users, a.k.a. guests

### **Object Properties**

Every user details page will show an overview of the core properties like

* Name
* AzureAD Object ID

on the left side of the screen in a glanceable way. This part will not scroll and be always visible in any tab.

![Core Object Properties](<../../.gitbook/assets/image (6).png>)

### Status information

The core properties include some glanceable information about the status of a user object:

* **Enabled** - The user is not blocked from sign in
* **Member** - The user is a native user in this tenant/organization
* **Guest** - This is an external user from a different organization
* **DE/US**... - Two letter code designating the user's [usage location](https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/licensing-groups-resolve-problems#usage-location-isnt-allowed) which is relevant for licensing.
* ![](<../../.gitbook/assets/image (5).png>) - When the object was created
* ![](<../../.gitbook/assets/image (2).png>) - Last signin activity

### Tabs

The right side of the screen shows the contents of the current tab, which can be&#x20;

* "Overview" with more information about the object
* "[Runbooks](user-details.md#runbooks)" showing available runbooks - as the name implies
* Raw [data sources](user-details.md#data-sources), like AzureAD, Sign in logs etc display in JSON. Only available for RealmJoin administrators.
