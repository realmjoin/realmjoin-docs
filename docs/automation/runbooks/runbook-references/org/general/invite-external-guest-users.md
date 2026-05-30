---
title: Invite External Guest Users
description: Invite external guest users to the organization
---

## Description
This runbook invites an external user as a guest user in Microsoft Entra ID.
Optional profile properties such as given name, surname, company name, usage location, manager, and sponsor can be set after the invitation is accepted.
The invited user can optionally be added to a specified group.

## Location
Organization → General → Invite External Guest Users

**Full Runbook name**

rjgit-org_general_Invite-external-guest-users

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All
  - Group.ReadWrite.All


## Parameters
### InvitedUserEmail

Email address of the guest user to invite.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### InvitedUserDisplayName

Display name of the guest user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GroupId

The object ID of the group to add the guest user to. If not specified, the user will not be added to any group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GivenName

Given name (first name) of the guest user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Surname

Surname (last name) of the guest user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CompanyName

Company name of the guest user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ManagerName

Manager to assign to the guest user. Select a user from the directory.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SponsorName

Sponsor to assign to the guest user. Select a user from the directory.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CustomizeInvitation

Enable to customize the invitation message and redirect URL.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### InvitationMessage

Custom message body to include in the invitation email. Only used when CustomizeInvitation is enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### InviteRedirectUrl

Custom URL the user is redirected to after accepting the invitation. Only used when CustomizeInvitation is enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### UsageLocation

ISO 3166-1 alpha-2 country code for the usage location of the guest user (e.g. "US", "DE").

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

