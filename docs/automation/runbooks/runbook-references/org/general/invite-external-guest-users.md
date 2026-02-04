---
title: Invite External Guest Users
description: Invites external guest users to the organization using Microsoft Graph.
---

## Description
This script automates the process of inviting external users as guests to the organization. Optionally, the invited user can be added to a specified group.

## Location
Organization → General → Invite External Guest Users

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All
  - Group.ReadWrite.All


## Parameters
### InvitedUserEmail

The email address of the guest user to invite.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### InvitedUserDisplayName

The display name for the guest user.

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


[Back to Table of Content](../../README.md)

