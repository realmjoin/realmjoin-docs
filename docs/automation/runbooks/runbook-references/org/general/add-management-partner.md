---
title: Add Management Partner
description: List or add a Partner Admin Link (PAL) for the tenant
---

## Description
Shows the Partner Admin Links (PAL) that tie the Azure usage of this tenant to a Microsoft partner, or adds a new one with the partner's ID. The link only credits the partner for the Azure consumption it manages.

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

List shows the current links, Add creates one for the "Partner ID".

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 0 |
| Type | Int32 |

**Portal options**

| Portal option | Value |
| --- | --- |
| List current PALs | 0 |
| Add a PAL | 1 |

### PartnerId

Microsoft Partner Network ID of the partner to link.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6457701 |
| Type | Int32 |
| Portal display name | Partner ID |



[Back to Runbook Reference overview](../../README.md)

