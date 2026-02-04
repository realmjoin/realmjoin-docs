---
title: Assign Or Unassign License
description: (Un-)Assign a license to a user via group membership.
---

## Description
(Un-)Assign a license to a user via group membership.

## Location
User → General → Assign Or Unassign License

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - GroupMember.ReadWrite.All
  - Group.ReadWrite.All


## Parameters
### UserName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### GroupID_License

production does not supprt "ref:LicenseGroup" yet

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Remove



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |


[Back to Table of Content](../../README.md)

