---
title: Convert To Shared Mailbox
description: Convert a user mailbox to a shared mailbox and back
---

## Description
Converts a mailbox to a shared mailbox or reverts it back to a regular user mailbox. Optionally delegates access and adjusts group memberships and license groups.

## Location
User → Mail → Convert To Shared Mailbox

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online API
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### UserName

User principal name of the mailbox.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### delegateTo

User principal name of the delegate who should receive access.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Remove

If set to true, converts a shared mailbox back to a regular mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### AutoMapping

If set to true, enables automatic Outlook mapping for delegated FullAccess.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### RemoveGroups

If set to true, removes existing group memberships when converting to a shared mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ArchivalLicenseGroup

Display name of a license group to assign when an archive or larger mailbox requires it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### RegularLicenseGroup

Display name of a license group to assign when converting back to a regular mailbox.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

