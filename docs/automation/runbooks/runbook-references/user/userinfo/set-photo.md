---
title: Set Photo
description: Set the profile photo for a user
---

## Description
Downloads a JPEG image from a URL and uploads it as the user's profile photo. This is useful to set or update user avatars in Microsoft 365.

## Location
User → Userinfo → Set Photo

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

### PhotoURI

URL to a JPEG image that will be used as the profile photo.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

