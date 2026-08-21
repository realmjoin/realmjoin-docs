---
title: Add Management Partner
description: List or add Management Partner Links (PAL)
---

## Description
This runbook lists existing Partner Admin Links (PAL) for the tenant or adds a new PAL.
It uses the Azure Management Partner API and supports an interactive action selection.

## Location
Organization → General → Add Management Partner

**Full Runbook name**

rjgit-org_general_add-management-partner

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Az.ManagementPartner (>= 0.8.0) |
| Schedulable | no |

## Permissions

### Permission notes
Owner or Contributor role on the Azure Subscription


## Parameters
### Action

Choice of action to perform: list existing PALs or add a new PAL.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 0 |
| Type | Int32 |

**Portal options**

| Portal option | Value |
| --- | --- |
| List current PALs |  |
| Add a PAL |  |

### PartnerId

Partner ID to set when adding a PAL.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6457701 |
| Type | Int32 |



[Back to Runbook Reference overview](../../README.md)

