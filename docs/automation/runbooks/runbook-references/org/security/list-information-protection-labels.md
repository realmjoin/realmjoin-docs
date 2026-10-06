---
title: List Information Protection Labels
description: List the sensitivity labels of the tenant with their IDs
---

## Description
Lists the Microsoft Purview Information Protection sensitivity labels of the tenant with their IDs, for example to pick the label ID needed by other runbooks. Nothing is changed.

## Location
Organization → Security → List Information Protection Labels

**Full Runbook name**

rjgit-org_security_list-information-protection-labels

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - InformationProtectionPolicy.Read.All
    - *Reads all tenant sensitivity labels to list their ids for other runbooks*


## Parameters


[Back to Runbook Reference overview](../../README.md)

