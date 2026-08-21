---
title: List All Administrative Template Policies
description: List all Administrative Template policies and their assignments
---

## Description
This runbook retrieves all Administrative Template policies from Intune.
It lists each policy and shows its current assignments.

## Location
Organization → General → List All Administrative Template Policies

**Full Runbook name**

rjgit-org_general_list-all-administrative-template-policies

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementConfiguration.Read.All
    - *Reads groupPolicyConfigurations and their assignments to list Administrative Template policies*
  - Group.Read.All
    - *Resolves assignment target group names via /groups/{id}*


## Parameters


[Back to Runbook Reference overview](../../README.md)

