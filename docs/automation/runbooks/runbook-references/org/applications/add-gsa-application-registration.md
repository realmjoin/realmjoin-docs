---
title: Add GSA Application Registration
description: Create a Global Secure Access application with its access group
---

## Description
Creates a Global Secure Access (GSA) application in Entra ID with its application segment (destination, ports, protocol) and connector group, plus a security group that controls who may use it. If the application already exists, only the segment, group and assignment are updated. Everything is validated before anything is created, and objects created in a failed run are removed again.

## Location
Organization → Applications → Add GSA Application Registration

**Full Runbook name**

rjgit-org_applications_add-GSA-application-registration

## Details

| Property | Value |
| --- | --- |
| Version | 1.3.3 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Application.ReadWrite.All
    - *Instantiates the app from the application template, patches onPremisesPublishing and adds app segments*
  - Directory.ReadWrite.All
    - *Required by the App Proxy endpoints: reads connector groups and assigns the app's connectorGroup*
  - Group.ReadWrite.All
    - *Creates the access security group for the app and deletes it on rollback*
  - AppRoleAssignment.ReadWrite.All
    - *Assigns the access group to the app via /servicePrincipals/{id}/appRoleAssignedTo*


## Parameters
### name

Base name of the application. The final name is prefix plus name, for example GSA-MyApp.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Application name |

### prefix

Text put in front of the name. A space is inserted unless the prefix ends with a hyphen, underscore or space.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Application name prefix |

### groupPrefix

Text put in front of the access group name, independent of the application prefix. Usually preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | App - Entra - GSA - |
| Type | String |
| Portal display name | Group name prefix |

### groupSuffix

Text appended to the access group name, for example " (users)". Leave empty for none.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### applicationType

Enterprise App creates a new GSA application. Quick Access App adds the segment to the tenant's existing Quick Access app instead.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Application type |

**Portal options**

| Portal option | Value |
| --- | --- |
| Enterprise App | nonwebapp |
| Quick Access App | quickaccessapp |

### connectorGroup

Connector group that publishes the application. The available groups are set up in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Connector group |

### destinationHost

Where the application lives: a host name (example.com), a single IP (192.168.0.1), a CIDR range (192.168.0.1/24) or an IP range (192.168.0.1..192.168.0.20).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Destination host or range |

### destinationType

Kind of destination, derived automatically from the format of the destination host.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ports

Ports to publish: a single port (443), several (80,443) or a range (8000-8080).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Ports |

### protocol

TCP, UDP or both.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Protocol |

**Portal options**

| Portal option | Value |
| --- | --- |
| TCP | tcp |
| UDP | udp |
| TCP,UDP | tcp,udp |



[Back to Runbook Reference overview](../../README.md)

