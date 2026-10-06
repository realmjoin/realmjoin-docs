---
title: Add Viva Engange Community
description: Create a Viva Engage community with owners
---

## Description
Creates a Viva Engage (Yammer) community with the given name, visibility and directory listing, and adds the named owners. The API user that creates the community can be removed from the resulting Microsoft 365 group once another owner exists.

## Location
Organization → General → Add Viva Engange Community

**Full Runbook name**

rjgit-org_general_add-viva-engange-community

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
    - *Resolves each owner UPN to a user object when CommunityOwners is provided*
  - Group.ReadWrite.All
    - *Finds the new community's M365 group, reads its owners and adds new owners*
  - GroupMember.ReadWrite.All
    - *Adds each new owner as group member via /groups/{id}/members/$ref*


## Parameters
### CommunityName

Name of the community, up to 264 characters.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Sample Community |
| Type | String |
| Portal display name | Community name |

### CommunityPrivate

A private community is visible only to its members.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Private community? |

### CommunityShowInDirectory

Lists the community in the Viva Engage directory so people can find it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Show in directory? |

### CommunityOwners

Sign-in names of the owners, separated by commas.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Owners |

### removeCreatorFromGroup

Takes the API user that created the community out of the group, as long as at least one other owner exists.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Remove the API user from the group? |



[Back to Runbook Reference overview](../../README.md)

