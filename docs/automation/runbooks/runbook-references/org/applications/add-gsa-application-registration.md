---
title: Add GSA Application Registration
description: Add a GSA application registration to Azure AD
---

## Description
This script creates a new Global Secure Access Application registration in Azure Active Directory (Entra ID) with comprehensive configuration options.

In addition to the application, a security group for managing access to the application is created (naming scheme configurable
via Runbook Customization) and assigned to the application's service principal.

If the application already exists, the runbook runs in update mode: app creation is skipped and only the segment /
group / assignment steps are performed. All lookups (e.g. connector group) are validated BEFORE anything is created.
If a later step fails anyway, objects created in this run (application, group) are rolled back and removed.
Pre-existing objects (update mode) are never removed.

## Location
Organization → Applications → Add GSA Application Registration

**Full Runbook name**

rjgit-org_applications_add-GSA-application-registration

## Details

| Property | Value |
| --- | --- |
| Version | 1.3.3 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Application.ReadWrite.All
  - Directory.ReadWrite.All
  - Group.ReadWrite.All
  - AppRoleAssignment.ReadWrite.All


## Parameters
### name

The base name of the Global Secure Access application to create. The final application name is built as "<prefix> <name>".

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Application Name (Must be unique) |

### prefix

Prefix added to the application name. A space is inserted between prefix and name unless the prefix ends
with "-", "_" or a space. Example: prefix "GSA-" + name "MyApp" results in application "GSA-MyApp".

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Application Name Prefix |

### groupPrefix

Prefix for the security group name. The group name is built as "<groupPrefix><name><groupSuffix>" -
independent of the application prefix. Example: groupPrefix "App - Entra - GSA - " + name "MyApp"
results in group "App - Entra - GSA - MyApp". Default: "App - Entra - GSA - ".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | App - Entra - GSA - |
| Type | String |
| Portal display name | Group name prefix (admin-defined, change via Runbook Customization) |

### groupSuffix

Optional suffix for the security group name, e.g. " (users)". Default: empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### applicationType

The type of GSA application to create. Options: "nonwebapp" (Enterprise App) or "quickaccessapp" (Quick Access App).

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Application Type (Unique) |

**Portal options**

| Portal option | Value |
| --- | --- |
| Enterprise App |  |
| Quick Access App |  |

### connectorGroup

The connectorGroup to be used for the application. Must be defined in the Runbook Customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Connector Group (Please define your connector groups in the Runbook Customization) |

### destinationHost

The destination host or IP range for the application. Supports formats: FQDN (example.com), single IP (192.168.0.1), CIDR notation (192.168.0.1/24), or IP range (192.168.0.1..192.168.0.20).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Destination Host or Range: example.com / 192.168.0.1 / 192.168.0.1/24 / 192.168.0.1..192.168.0.20 |

### destinationType

The type of destination specified. Options: "fqdn", "ip", "ipRangeCidr", or "ipRange". Hidden in UI as it's automatically determined from destinationHost format.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ports

The port(s) to configure for the application. Supports single port (443), multiple ports (80,443), or port range (8000-8080).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Ports (e.g., 443 or 80,443 or 8000-8080) |

### protocol

The network protocol to use. Options: "tcp", "udp", or "tcp,udp". Default is "tcp".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Protocol |

**Portal options**

| Portal option | Value |
| --- | --- |
| TCP |  |
| UDP |  |
| TCP,UDP |  |



[Back to Runbook Reference overview](../../README.md)

