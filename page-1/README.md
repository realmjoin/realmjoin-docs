# User, Group and Device management

## Overview

RealmJoin allows you to review and interact with Azure Active Directory (Azure AD) objects like users, groups and devices.&#x20;

It combines information from multiple sources such as Intune (Microsoft Endpoint Manager), Microsoft Defender, the Windows AutoPilot service and Sign-in security logs into one single view.&#x20;

Use the [navigation ](../readme/navigation.md)to either inspecht yout [tenant/organization](organization-details.md), [users](user-list/), [groups ](group-list/)or [devices ](device-list/)and search and drill down accross corelated objects and trigger [operations ](../runbooks/)directly in context.

Users, Groups and Devices all have a list interface to find the object of interest and a details page for reviewing/interacting with each object individually.&#x20;

The details pages share some common elements for all of these areas:

### **Object Properties**



### Runbooks

RealmJoin offers operators to automate day to day tasks using [Runbooks](../runbooks/). RealmJoin Portal will offer context specific runbooks on tenant, device, group and user level via a seperate tab.

![Runbook Tab](<../.gitbook/assets/2022-02-07 Runbooks tab.png>)

### Data sources

RealmJoin Portal collect information from multiple sources. You can review the full source information for every object in source-specific tabs and is presented as JSON data.

Raw source data is only available to RealmJoin administrators.

![Raw JSON Source Data](<../.gitbook/assets/2022-02-07 json source.png>)



