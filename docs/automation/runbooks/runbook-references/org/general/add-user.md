---
title: Add User
description: Create a new user account
---

## Description
This runbook creates a new cloud user in Microsoft Entra ID and applies standard user properties.
It can optionally assign a license group, add the user to additional groups, and create an Exchange Online archive mailbox.

## Location
Organization → General → Add User

**Full Runbook name**

rjgit-org_general_add-user

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>ExchangeOnlineManagement (>= 3.9.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
  - DeviceManagementManagedDevices.PrivilegedOperations.All

### RBAC roles
- User Administrator


## Parameters
### GivenName

First name of the user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Surname

Last name of the user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### UserPrincipalName

User principal name (UPN). If empty, the runbook generates a UPN from the provided name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### MailNickname

Mail nickname (alias) used for the user. If empty, the runbook derives it from the UPN.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### DisplayName

Display name of the user. If empty, the runbook derives it from the provided name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### CompanyName

Company name of the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### JobTitle

Job title of the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Department

Department of the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ManagerId

Optional manager user ID to set for the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SponsorIds

Optional sponsor user IDs to set for the user. Multiple sponsors supported.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String[] |

### MobilePhone

Mobile phone number of the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### LocationName

Office location name used for portal customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StreetAddress

Street address of the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### PostalCode

Postal code of the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### City

City of the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### State

State or region of the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Country

Country of the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### UsageLocation

Usage location used for licensing.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### DefaultLicense

Optional license group to assign to the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | License group to assign |

### DefaultGroups

Comma-separated list of groups to assign to the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### InitialPassword

Initial password. If empty, the runbook generates a random password.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### EnableEXOArchive

If set to true, creates an Exchange Online archive mailbox for the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Create Exchange Online Archive Mailbox |



[Back to Runbook Reference overview](../../README.md)

