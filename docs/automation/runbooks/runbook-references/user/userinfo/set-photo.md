---
title: Set Photo
description: Set the profile photo for a user
---

## Description
Downloads a JPEG image from a URL and uploads it as the user's profile photo. This is useful to set or update user avatars in Microsoft 365.

## Location
User → Userinfo → Set Photo

**Full Runbook name**

rjgit-user_userinfo_set-photo

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### PhotoURI

URL to a JPEG image that will be used as the profile photo.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Photo Source URL: |



[Back to Runbook Reference overview](../../README.md)

