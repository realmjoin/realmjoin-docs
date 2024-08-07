# Overview

RealmJoin allows you to review and interact with Entra ID objects like users, groups and devices.&#x20;

It combines information from multiple sources such as Intune (Microsoft Endpoint Manager), Microsoft Defender, the Windows Autopilot service and sign-in security logs into one single view.&#x20;

Use the [navigation ](../readme/navigation.md)to inspect your [tenant/organization](organization-details.md), [users, groups or devices](user-list/) and search and drill down across corelated objects and trigger [operations ](../automation/runbooks/)directly in context.

Users, Groups and Devices all have a list interface to find the object of interest and a [details page](user-list/user-details.md) for reviewing and interacting with each object individually.&#x20;

The details pages share some common elements for all these areas:

### **Object Properties**

Every object's detail page will show an overview of the core properties such as

* Name
* Entra ID Object ID
* Object Account Status
* License usage location

The object properties are static and be visible in any tab.

![Core Object Properties](<../.gitbook/assets/image (74).png>)

The right side of the screen shows the current tab, which can be&#x20;

* "Overview" with more information about the object
* "[Runbooks](user-group-device-management.md#runbooks)" showing available runbooks - as the name implies
* Different [data sources](user-group-device-management.md#data-sources), like Azure AD, Sign in logs etc.

### Runbooks

RealmJoin offers operators the ability to automate day to day tasks using [Runbooks](../automation/runbooks/). RealmJoin Portal offers context specific runbooks on tenant, device, group and user level via a separate tab.

![Runbook Tab](<../.gitbook/assets/2022-02-07 Runbooks tab.png>)

### Data sources

RealmJoin Portal collects information from multiple sources. You can review the full source information for every object in source-specific tabs and it is presented as JSON data.

Raw source data is only available to RealmJoin administrators.

![Raw JSON Source Data](<../.gitbook/assets/2022-02-07 json source.png>)



