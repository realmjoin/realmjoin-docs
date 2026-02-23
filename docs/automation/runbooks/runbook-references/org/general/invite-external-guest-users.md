---
title: Invite External Guest Users
description: Invite external guest users to the organization
---

## Description
This runbook invites an external user as a guest user in Microsoft Entra ID.
It can optionally add the invited user to a specified group.

## Location
Organization → General → Invite External Guest Users

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
| Required | true |
| Default Value |  |
| Type | String |

### GroupId

The object ID of the group to add the guest user to.
If not specified, the user will not be added to any group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

