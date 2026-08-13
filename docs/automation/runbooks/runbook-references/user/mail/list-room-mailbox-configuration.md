---
title: List Room Mailbox Configuration
description: List room mailbox configuration
---

## Description
Reads room metadata and lists calendar processing settings. This helps validate room resource configuration and booking behavior.

## Location
User → Mail → List Room Mailbox Configuration

**Full Runbook name**

rjgit-user_mail_list-room-mailbox-configuration

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>ExchangeOnlineManagement (>= 3.9.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Place.Read.All


## Parameters
### UserName

User principal name of the room mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

