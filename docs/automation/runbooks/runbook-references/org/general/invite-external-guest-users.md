---
title: Invite External Guest Users
description: Invite an external person as a guest user
---

## Description
Sends a Microsoft Entra ID guest invitation to an external email address. Optionally the guest is added to a group, and profile details such as name, company, usage location, manager and sponsor are set on the guest account right away. The invitation email and the landing page can be customized.

## Common use cases

- Basic guest invite: provide only the email address and the display name; all profile and group parameters can be left blank.
- Full onboarding: supply all optional fields to set profile properties, assign a manager and a sponsor, and add the guest to a group in a single run.

## Parameter interactions

- Profile properties (`givenName`, `surname`, `companyName`, `usageLocation`) are applied only when they are not empty; omitting them skips the update call entirely.
- Manager assignment, sponsor assignment and group membership each require their respective parameters; all of them are skipped silently when not provided.


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

Email address of the person to invite.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### InvitedUserDisplayName

Name shown for the guest in the directory.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GroupId

Group the guest is added to. Preset in the runbook customization; empty means none.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GivenName

First name of the guest.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Surname

Last name of the guest.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CompanyName

Company the guest works for.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ManagerName

User who becomes the guest's manager.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SponsorName

User recorded as the guest's sponsor.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CustomizeInvitation

Shows fields for an own invitation message and redirect URL.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### InvitationMessage

Text included in the invitation email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### InviteRedirectUrl

Page the guest lands on after accepting, for example a SharePoint site.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### UsageLocation

Two-letter country code, for example US or DE, needed before licenses can be assigned.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

