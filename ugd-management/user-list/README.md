# User, Group and Device Lists

Selecting the Users, Groups or Devices tab offers administrators a simple way to search or review users in their environment. Clicking the name of a user, group or device object will lead you to the respective object's details page.

<figure><img src="../../.gitbook/assets/image (193).png" alt=""><figcaption><p>User List</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (304).png" alt=""><figcaption><p>Group List</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (305).png" alt=""><figcaption><p>Device List</p></figcaption></figure>

### Object Types

User, Group and Device object types are separated in the same manner as Entra ID:

{% tabs %}
{% tab title="Users" %}
Users include:

* Entra ID user objects
* Entra ID external users, a.k.a. Guests
* Shared mailboxes
* Room and Equipment mailboxes
* Administrative user accounts
{% endtab %}

{% tab title="Groups" %}
Group objects include:

* Entra ID static and dynamic groups
* Exchange Online mail-enabled groups and distribution groups
* Microsoft Office365 groups and teams
{% endtab %}

{% tab title="Devices" %}
Devices include:

* Entra ID joined clients, like modern workplace clients
* Entra ID registered devices, like user-owned phones and tablets
* Other devices, like printers used by MS Universal Printing or Surface Hubs
{% endtab %}
{% endtabs %}

### Filters

You can use the filters above the list to limit search results to specific User, Group or Device objects:

{% tabs %}
{% tab title="Users" %}
<figure><img src="../../.gitbook/assets/image (183).png" alt=""><figcaption><p>User Filters</p></figcaption></figure>

**User Type**

* **Any** - Both Members and Guests are displayed
* **Members** - Users native to your tenant (default)
* **Guests** - Azure B2B Guests invited from other tenants

#### ADM Accounts

* **Any** - Displays all user accounts (default)
* **ADM** - Filter to only show users whose DisplayName starts with "ADM" (admin accounts)
* **Non-ADM** - Negation of the "ADM" Filter

#### Data completeness

* **Any** - Show users with both complete and missing data (default)
* **No Data** - Show only users with missing data in "job title", "city" or "country"
{% endtab %}

{% tab title="Groups" %}
<figure><img src="../../.gitbook/assets/image (131).png" alt=""><figcaption><p>Group Filters</p></figcaption></figure>

#### Only RealmJoin Groups

Turn this toggle **off** to include groups that do not match any RealmJoin naming scheme. When **off** all Entra ID groups will be shown.

By default (**on**), RealmJoin only lists groups related to RealmJoin's operation, such as

* Licensing Groups ("lic -")
* Application-Assignment Groups ("app -")
* Configuration/Permission Groups ("cfg -")

#### Membership Type

Limit the groups shown to

* **Static** - Groups with static member assignment
* **Dynamic** - Groups with dynamic membership
* **Any** - All groups (default)

#### Group Type

Limit the search results to the type of Entra ID group

* **Security** - List Security Groups. This currently also includes Exchange-related groups like Distribution Lists and mail-enabled Security Groups.
* **Unified** - List Microsoft 365 groups/teams as well as RealmJoin internal groups like "RealmJoin - All Users"
{% endtab %}

{% tab title="Devices" %}
<figure><img src="../../.gitbook/assets/image (110).png" alt=""><figcaption><p>Device Filters</p></figcaption></figure>

#### Only Enabled

If toggled **on** (default) devices that have been disabled in Entra ID will not be shown.

Switch to **off** to see all devices including ones that are not enabled.

#### Operating System / Device Type

Use this filter to select devices based on their operating system or deployment method.

* **Any** - Show all devices
* **Win** (Default) - Show only Windows based devices
* **Mac** - Show only MacOS based devices
* **CloudPC** - Show only Windows365 devices
* **Mobiles** - Show iOS and Android devices
* **S-Hub** - Show Surface Hub devices
* **Printer** - Show Printers (from Universal Printing)
* **Other** - Show devices not matched by any other filters

#### Compliance State

For managed devices, you can choose to limit the results according to their [compliance state](https://docs.microsoft.com/en-us/mem/intune/protect/device-compliance-get-started) in Intune.

* **Any** - Show all devices
* **Compliant** - Show only devices reported as compliant by Intune
* **Non-Compliant** - Show only devices reported as not currently compliant by Intune
{% endtab %}
{% endtabs %}
