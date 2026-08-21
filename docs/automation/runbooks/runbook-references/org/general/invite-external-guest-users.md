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

## Details

| Property | Value |
| --- | --- |
| Version | 2.0.3 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Notes
Common Use Cases:
- Basic guest invite: provide only the email address and display name; all profile and group parameters can be left blank
- Full onboarding: supply all optional fields to set profile properties, assign a manager/sponsor, and add to a group in a single run

Parameter Interactions:
- Profile properties (givenName, surname, companyName, usageLocation) are applied only when non-empty; omitting them skips the PATCH call entirely
- Manager and sponsor assignment and group membership each require their respective parameters; all are silently skipped when not provided

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All
    - *Creates the invitation, patches guest profile properties and sets manager and sponsor*
  - Group.ReadWrite.All
    - *Verifies the target group and adds the guest via /groups/{id}/members/$ref*
  - Organization.Read.All
    - *Reads the tenant id to build the default invite redirect URL*


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

