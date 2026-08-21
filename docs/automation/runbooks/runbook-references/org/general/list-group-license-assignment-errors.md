---
title: List Group License Assignment Errors
description: Report groups that have license assignment errors
---

## Description
This runbook searches for Entra ID groups that have members with license assignment errors.
It prints the affected group names and object IDs.

## Location
Organization → General → List Group License Assignment Errors

**Full Runbook name**

rjgit-org_general_list-group-license-assignment-errors

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - GroupMember.Read.All
    - *Least-privileged option for listing groups with license errors*
  - Group.Read.All
    - *Reads the groups filtered on hasMembersWithLicenseErrors for the report*


## Parameters


[Back to Runbook Reference overview](../../README.md)

