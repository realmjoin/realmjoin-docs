---
title: Set Photo
description: Set the profile photo of this user from a URL
---

## Description
Downloads a JPEG image from the given URL and sets it as the profile photo of this user. The photo shows up in Microsoft 365 apps such as Teams and Outlook. An existing photo is replaced.

## Location
User → Userinfo → Set Photo

**Full Runbook name**

rjgit-user_userinfo_set-photo

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All
    - *Reads the user and uploads the photo via PUT /users/{id}/photo/$value*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### PhotoURI

Web address of a JPEG image the runbook can download.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Photo URL |



[Back to Runbook Reference overview](../../README.md)

