---
title: Add Viva Engange Community
description: Create a Viva Engage (Yammer) community
---

## Description
This runbook creates a Viva Engage community via the Yammer REST API using a stored developer token.
It can optionally assign owners and remove the initial API user from the resulting Microsoft 365 group.

## Location
Organization → General → Add Viva Engange Community

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - Group.ReadWrite.All
  - GroupMember.ReadWrite.All


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



[Back to Runbook Reference overview](../../README.md)

