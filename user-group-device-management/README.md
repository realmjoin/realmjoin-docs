# User, Group and Device management

## Overview

RealmJoin allows you to review and interact with Azure Active Directory (Azure AD) objects like users, groups and devices.&#x20;

It combines information from multiple sources such as Intune (Microsoft Endpoint Manager), Microsoft Defender, the Windows AutoPilot service and Sign-in security logs into one single view.&#x20;

Use the [navigation ](../readme/navigation.md)to either inspect your [tenant/organization](organization-details.md), [users](user-list/), [groups ](group-list/)or [devices ](device-list/)and search and drill down across corelated objects and trigger [operations ](../runbooks/)directly in context.

Users, Groups and Devices all have a list interface to find the object of interest and a details page for reviewing/interacting with each object individually.&#x20;

The details pages share some common elements for all of these areas:

### **Object Properties**

Every object's details page will show an overview of the core properties like

* Name
* Azure AD Object ID
* Status information (like "Enabled")&#x20;
* License usage location

on the left side of the screen in a glanceable way. This part will not scroll and be always visible in any tab.

![Core Object Properties](<../.gitbook/assets/image (6).png>)

The right side of the screen shows the current tab, which can be&#x20;

* "Overview" with more information about the object
* "[Runbooks](./#runbooks)" showing available runbooks - as the name implies
* Diffenrent [data sources](./#data-sources), like Azure AD, Sign in logs etc.

### Runbooks

RealmJoin offers operators to automate day to day tasks using [Runbooks](../runbooks/). RealmJoin Portal will offer context specific runbooks on tenant, device, group and user level via a seperate tab.

![Runbook Tab](<../.gitbook/assets/2022-02-07 Runbooks tab.png>)

### Data sources

RealmJoin Portal collects information from multiple sources. You can review the full source information for every object in source-specific tabs and is presented as JSON data.

Raw source data is only available to RealmJoin administrators.

![Raw JSON Source Data](<../.gitbook/assets/2022-02-07 json source.png>)



