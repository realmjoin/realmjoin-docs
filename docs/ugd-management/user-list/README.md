---
type: User, Group & Device Management
description: >-
  Search and browse users, groups, and devices, and open any object's details
  page from RealmJoin Portal.
---

# User, Group and Device Lists

{% embed url="https://www.youtube.com/watch?v=IlIEnhoaaIA" %}
Video tutorial (shows an older version of the lists)
{% endembed %}

Selecting the Users, Groups or Devices tab lists the users, groups and devices of your tenant. Click the name of an object to open its details page.

<figure><img src="../../.gitbook/assets/image (213).png" alt=""><figcaption><p>User List</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (318).png" alt=""><figcaption><p>Group List</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (319).png" alt=""><figcaption><p>Device List</p></figcaption></figure>

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

### Search, Export and Paging

Type into the search box and press Enter to search. RealmJoin Portal first searches Microsoft Graph directly (**Basic search**) and loads a full copy of the list in the background. Once it is ready, the list switches to **Advanced search**, which searches more fields, supports the [advanced search syntax](../../analyze-and-export/advanced-search/advanced-search-syntax.md), pages through all results and allows sorting the whole list. The footer of the list shows which mode is active and how old the data is.

In advanced search you can also use:

* **Export** - Downloads all rows matching the current filters and search, with all available fields, as an Excel file
* **Reload** - Refreshes the data

See [Advanced Search](../../analyze-and-export/advanced-search/) for details.

Your filters and search are kept in the page's URL, so you can bookmark or share a filtered list. RealmJoin Portal also remembers them for about an hour when you come back to the list.

### Filters

You can use the filters above the list to limit search results to specific User, Group or Device objects:

{% tabs %}
{% tab title="Users" %}
<figure><img src="../../.gitbook/assets/image (204).png" alt=""><figcaption><p>User Filters</p></figcaption></figure>

**Account state**

* **Any** - Show enabled and disabled users
* **Enabled** - Show only users who can sign in (default)
* **Disabled** - Show only users who are blocked from sign-in

**User Type**

* **Any** - Both Members and Guests are displayed
* **Members** - Users native to your tenant (default)
* **Guests** - Azure B2B Guests invited from other tenants

The list shows each user's name, UPN, object ID, creation date, job title, city, country and type. Disabled users are shown struck through.
{% endtab %}

{% tab title="Groups" %}
<figure><img src="../../.gitbook/assets/image (156).png" alt=""><figcaption><p>Group Filters</p></figcaption></figure>

**Only RealmJoin**

Turn this toggle **off** to include groups that do not match any RealmJoin naming scheme. When **off** all Entra ID groups will be shown.

By default (**on**), RealmJoin only lists groups whose name starts with one of the [group prefixes](../../administration-and-settings/groups.md) configured for your tenant, such as

* Licensing Groups ("lic -")
* Application-Assignment Groups ("app -")
* Configuration/Permission Groups ("cfg -")

**Teams**

* **Any** - All groups (default)
* **Teams** - Only groups that are a Team
* **Non-Teams** - Only groups that are not a Team

**Membership Type**

Limit the groups shown to

* **Any** - All groups (default)
* **Static** - Groups with static member assignment
* **Dynamic** - Groups with dynamic membership

**Group Type**

Limit the search results to the type of Entra ID group

* **Any** - All groups (default)
* **Security** - List Security Groups. In basic search this also includes Exchange-related groups like Distribution Lists.
* **Unified** - List Microsoft 365 groups/teams as well as RealmJoin internal groups like "RealmJoin - All Users"

The list shows the group's type badges (**S**ecurity / **U**nified, **S**tatic / **D**ynamic, **T**eams), its name, member count, object ID and whether it is a **RealmJoin** or a **General** group.
{% endtab %}

{% tab title="Devices" %}
<figure><img src="../../.gitbook/assets/image (135).png" alt=""><figcaption><p>Device Filters</p></figcaption></figure>

**Type**

Use this filter to select devices based on their operating system or device type.

* **Any** (default) - Show all devices
* **Desktops** - Show Windows, macOS and Linux devices
* **CloudPC** - Show only Windows 365 Cloud PCs (advanced search only)
* **Mobiles** - Show iOS, iPadOS and Android devices
* **Other** - Show other devices, like Surface Hubs and printers from Universal Print (advanced search only)

**Account state**

* **Any** - Show enabled and disabled devices
* **Enabled** - Show only devices that are enabled in Entra ID (default)
* **Disabled** - Show only devices that are disabled in Entra ID

**Compliance State**

For managed devices, you can choose to limit the results according to their [compliance state](https://docs.microsoft.com/en-us/mem/intune/protect/device-compliance-get-started) in Intune.

* **Any** - Show all devices
* **Compliant** (default) - Show only devices reported as compliant by Intune
* **Non-compliant** - Show only devices reported as not currently compliant by Intune

{% hint style="info" %}
By default the list shows only compliant devices. Select **Any** to also see non-compliant and unmanaged devices.
{% endhint %}

The list shows each device's name, ID, first and last seen dates, RealmJoin Client version, operating system, manufacturer, model, serial number, last Intune sync, owner and compliance. **Last Seen** is based on Entra ID and enhanced with RealmJoin telemetry when available. It is sorted by **Last Seen**, most recent first.
{% endtab %}
{% endtabs %}

### Filtered by Software Report

When you open the user or device list from the [Software Report](../../analyze-and-export/software-reporting.md) or from the install counts on an app's details page, the list is limited to the users or devices with that software. A **Filtered by Software Report** badge shows above the list. Click it to remove the filter.
