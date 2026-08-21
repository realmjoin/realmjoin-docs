---
title: Add Viva Engange Community
description: Create a Viva Engage (Yammer) community
---

## Description
This runbook creates a Viva Engage community via the Yammer REST API using a stored developer token.
It can optionally assign owners and remove the initial API user from the resulting Microsoft 365 group.

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

Name of the community to create. Maximum length is 264 characters.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Sample Community |
| Type | String |

### CommunityPrivate

If set to true, the community is created as private.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### CommunityShowInDirectory

If set to true, the community is visible in the directory.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### CommunityOwners

Comma-separated list of owner UPNs to add to the community.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### removeCreatorFromGroup

If set to true, removes the initial API user from the group when at least one other owner exists.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Remove initial API user/owner from group |



[Back to Runbook Reference overview](../../README.md)

